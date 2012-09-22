package com.deengames.gamebook.screen;
import com.blastcube.controls.ThreeScaleButton;
import com.blastcube.core.Game;
import com.blastcube.core.Screen;
import com.blastcube.vectorgraphics.Resize;
import com.deengames.gamebook.GameBookMain;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.events.Event;
import nme.events.MouseEvent;
import nme.Lib;
import nme.media.Sound;
import nme.media.SoundChannel;
import nme.text.TextField;

/**
 * ...
 * @author ashes999
 */

class TitleScreen extends Screen
{	
	// Control audio playback
	private var sound:Sound;
	private var soundChannel:SoundChannel;
	
	// Can't use new; buttons need access to the current screen, which isn't set yet.
	public function new(swfName:String="assets/swf/titlescreen.swf", symbolName:String="titlescreen") 
	{		
		super();
		var background:Sprite = this.addRasterizedVector(swfName, symbolName, Resize.AtMost, this.stageWidth, this.stageHeight);
		
		var startButton:Sprite = this.addRasterizedVector("assets/swf/buttons.swf", "startButton", Resize.AtMost, Math.floor(this.stageWidth / 5), Math.floor(this.stageWidth / 5));
		startButton.x = (this.stageWidth - startButton.width) / 2;
		startButton.y = this.stageHeight - (2 * startButton.height);
		startButton.addEventListener(MouseEvent.MOUSE_DOWN, function(event:Event) {
			Game.showScreen(new ShowScenesScreen(GameBookMain.projectFileName));
			
			if (this.soundChannel != null) {
				this.soundChannel.stop();
			}
		});
		
		this.sound = Assets.getSound("assets/audio/scenes/titlescreen.mp3");
		this.soundChannel = sound.play();
	}
}