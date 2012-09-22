package com.deengames.gamebook.screen;
import com.blastcube.core.exception.Exception;
import com.blastcube.core.Game;
import com.blastcube.core.Screen;
import com.blastcube.vectorgraphics.Resize;
import com.blastcube.vectorgraphics.VectorImageFactory;
import com.deengames.gamebook.model.Project;
import com.deengames.gamebook.model.Scene;
import com.deengames.gamebook.persistance.PersistanceMediator;
import format.SWF;
import format.swf.MovieClip;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.events.Event;
import nme.events.MouseEvent;
import nme.Lib;
import nme.media.Sound;
import nme.media.SoundChannel;
import nme.text.TextField;

using com.blastcube.extensions.TextFieldExtensions;

/**
 * ...
 * @author 
 */

class ShowScenesScreen extends Screen
{
	private var AUDIO_BUTTON_OFFSET:Int = 4;
	private var TEXT_FIELD_BORDER_SIZE:Int = 8;
	private var TEXT_FIELD_TOOLBAR_ORIGINAL_HEIGHT:Int = 32;
	private var TEXT_FIELD_TOOLBAR_HEIGHT:Int;
	
	// Current project and scene
	private var project:Project;
	private var currentScene:Scene;
	private var currentSceneIndex:Int;
	
	// Background and text field and window for displaying text
	private var background:Sprite;
	private var textField:TextField;
	private var window:Sprite;
	
	// Control audio playback
	private var sound:Sound;
	private var soundChannel:SoundChannel;
	
	public function new(fileName:String) 
	{	
		super();
		
		// Any validation failures will throw an exception here
		this.project = new PersistanceMediator().loadProject(fileName);
		validateProject(this.project);
				
		// Not used; instantiated here to guarantee correct Z-order. We replace it in showNextScene.
		this.background = this.addRasterizedVector("assets/swf/dummy.swf", "dummy", Resize.AtMost, this.stageWidth, this.stageHeight);
		
		this.window = this.addRasterizedVector("assets/swf/window.swf", "window", Resize.AtMost, this.stageWidth, this.stageHeight);
		window.y = this.stageHeight - window.height;
		
		this.addTextWindow();
		this.addPlayAudioButton();
		this.addNextSceneButton();		
		
		this.currentSceneIndex = -1;
		this.showNextScene();
	}
	
	private function validateProject(project:Project)
	{
		for (i in 0 ... project.sceneCount) {
			var scene:Scene = project.getScene(i);
			// Sneaky validation: preload
			VectorImageFactory.loadImage(project.scenesFile, scene.background);
			
			var audioFileName:String = "assets/audio/scenes/scene" + (i + 1) + ".mp3";
			if (Assets.getSound(audioFileName) == null) {
				throw new Exception("Can't find audio " + audioFileName + " for scene " + scene.name);
			}
		}
	}
	
	private function addTextWindow() : Void
	{
		this.textField = this.addTextField("");
		var fontSize:Int = Math.floor(this.window.height / 10);
		this.textField.setFontSize(fontSize);
		this.textField.setFontColour(0xFFFFFF);
		
		this.textField.multiline = true;
		this.textField.wordWrap = true;
		
		this.textField.width = this.stageWidth - (2 * this.TEXT_FIELD_BORDER_SIZE);
		this.textField.height = this.window.height - (2 * this.TEXT_FIELD_BORDER_SIZE);
		
		this.TEXT_FIELD_TOOLBAR_HEIGHT = Math.floor(this.window.scaleY * TEXT_FIELD_TOOLBAR_ORIGINAL_HEIGHT);
		
		this.textField.x = this.TEXT_FIELD_BORDER_SIZE;
		this.textField.y = this.stageHeight - this.window.height + this.TEXT_FIELD_TOOLBAR_HEIGHT + this.TEXT_FIELD_BORDER_SIZE;
	}
	
	private function addPlayAudioButton() : Void
	{
		var playButton:Sprite = this.addRasterizedVector("assets/swf/buttons.swf", "playAudioButton", Resize.AtMost, this.TEXT_FIELD_TOOLBAR_HEIGHT, this.TEXT_FIELD_TOOLBAR_HEIGHT);
		playButton.x = this.width - playButton.width - TEXT_FIELD_BORDER_SIZE;
		playButton.y = this.window.y + AUDIO_BUTTON_OFFSET;
		playButton.addEventListener(MouseEvent.MOUSE_DOWN, function(event:Event) {
			if (this.soundChannel != null) {
				this.soundChannel.stop();
				this.soundChannel = this.sound.play();
			}
		});
	}
	
	private function playCurrentSceneAudio() : Void
	{
		this.sound = Assets.getSound("assets/audio/scenes/scene" + (currentSceneIndex + 1) + ".mp3");
		this.soundChannel = sound.play();
	}
	
	private function addNextSceneButton() : Void
	{
		var nextButton:Sprite = this.addRasterizedVector("assets/swf/buttons.swf", "startButton", Resize.AtLeast, this.TEXT_FIELD_TOOLBAR_HEIGHT, this.TEXT_FIELD_TOOLBAR_HEIGHT);
		nextButton.x = (this.width - nextButton.width);
		nextButton.y = 0;
		nextButton.addEventListener(MouseEvent.MOUSE_DOWN, function(event:Event) {
			
			if (this.soundChannel != null) {
				this.soundChannel.stop();
			}
			
			if (this.currentSceneIndex == this.project.sceneCount - 1) {
				showTheEndScene();
			} else {
				showNextScene();
			}
		});
	}
	
	private function showTheEndScene() : Void
	{
		var background:Sprite = this.addRasterizedVector(this.project.scenesFile, "theend", Resize.AtMost, this.stageWidth, this.stageHeight);
		// Conveniently covers everything. Just slap a new button on top and we're done.
		var homeButton:Sprite = this.addRasterizedVector("assets/swf/buttons.swf", "homeButton", Resize.AtMost, Math.floor(this.stageWidth / 5), Math.floor(this.stageHeight / 5));
		
		this.sound = Assets.getSound("assets/audio/scenes/theend.mp3");
		this.soundChannel = sound.play();
		
		homeButton.x = (this.stageWidth - homeButton.width) / 2;
		homeButton.y = this.stageHeight - (2 * homeButton.height);		
		
		homeButton.addEventListener(MouseEvent.CLICK, function(event:Event) {
			if (this.soundChannel != null) {
				this.soundChannel.stop();
			}
			Game.showScreen(new TitleScreen());
		});
	}
	
	private function showNextScene() : Void
	{
		this.currentSceneIndex++;
		this.currentScene = project.getScene(this.currentSceneIndex);			
		
		var background:Sprite = this.addRasterizedVector(this.project.scenesFile, this.currentScene.background, Resize.AtMost, this.stageWidth, this.stageHeight);
		
		if (this.background != null) {
			// Fix Z order
			this.swapChildren(background, this.background);
			this.removeImage(this.background);
		}
		this.background = background;
		
		this.textField.text = this.currentScene.text;
		this.playCurrentSceneAudio();
	}
}