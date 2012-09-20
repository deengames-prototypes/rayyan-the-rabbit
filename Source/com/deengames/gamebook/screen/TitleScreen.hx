package com.deengames.gamebook.screen;
import com.blastcube.controls.ThreeScaleButton;
import com.blastcube.core.Game;
import com.blastcube.core.Screen;
import com.blastcube.vectorgraphics.Resize;
import com.deengames.gamebook.GameBookMain;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.Lib;

/**
 * ...
 * @author ashes999
 */

class TitleScreen extends Screen
{	
	// Can't use new; buttons need access to the current screen, which isn't set yet.
	public function new(swfName:String="assets/swf/titlescreen.swf", symbolName:String="titlescreen") 
	{		
		super();
		var background:Sprite = addRasterizedVector(swfName, symbolName, Resize.AtMost, this.stageWidth, this.stageHeight);
		Lib.current.stage.addChild(background);
		//this.fitToScreen(background);
		
		var newGame:ThreeScaleButton = this.addButton("New Game");
		newGame.name = "newgame";
		newGame.setX((Lib.current.stage.stageWidth - newGame.width) / 2);
		newGame.setY(0.75 * Lib.current.stage.stageHeight);

		newGame.setClickHandler(function(event) {
			Game.showScreen(new ShowScenesScreen(GameBookMain.projectFileName));
		});
	}
}