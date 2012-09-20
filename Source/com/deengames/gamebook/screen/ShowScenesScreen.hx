package com.deengames.gamebook.screen;
import com.blastcube.core.exception.Exception;
import com.blastcube.core.Screen;
import com.blastcube.vectorgraphics.Resize;
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
		
		this.currentSceneIndex = 0;
		
		// Any validation failures will throw an exception here
		this.project = new PersistanceMediator().loadProject(fileName);
		this.currentScene = project.getScene(this.currentSceneIndex);
		
		// Show first screen
		this.background = this.addRasterizedVector(currentScene.background, "scene", Resize.AtMost, this.stageWidth, this.stageHeight);
		
		this.window = this.addRasterizedVector("assets/swf/window.swf", "window", Resize.AtMost, this.stageWidth, this.stageHeight);
		window.y = this.stageHeight - window.height;
		
		this.addTextWindow(currentScene.text);
		this.addPlayAudioButton();
		this.playCurrentSceneAudio();
	}
	
	private function addTextWindow(text:String) : Void
	{
		this.textField = this.addTextField(text);
		//this.textField.setFontSize(24);
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
		playButton.addEventListener(MouseEvent.MOUSE_DOWN, restartAudio);
	}
	
	private function playCurrentSceneAudio() : Void
	{
		this.sound = Assets.getSound("assets/audio/scene" + (currentSceneIndex + 1) + ".mp3");
		this.soundChannel = sound.play();
	}
	
	private function restartAudio(event:Event) : Void
	{
		if (this.soundChannel != null) {
			this.soundChannel.stop();
			this.soundChannel = this.sound.play();
		}
	}
}