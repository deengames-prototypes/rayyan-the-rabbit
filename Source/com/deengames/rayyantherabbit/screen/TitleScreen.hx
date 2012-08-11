package com.deengames.rayyantherabbit.screen;
import com.blastcube.controls.ThreeScaleButton;
import com.blastcube.core.Screen;
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
	public override function init() 
	{		
		var background:Sprite = this.addImage("assets/common/starfield.jpg", "background");
		this.fitToScreen(background);
		
		var titleText:Sprite = this.addImage("assets/legend-of-hamza.png", "title text");
		titleText.x = (Lib.current.stage.stageWidth - titleText.width) / 2;
		titleText.y = (Lib.current.stage.stageHeight - titleText.height) * 0.2;
		
		var newGame:ThreeScaleButton = this.addButton("New Game");
		newGame.name = "newgame";
		newGame.setX(Lib.current.stage.stageWidth / 3);
		newGame.setY(titleText.y + titleText.height + newGame.getHeight());
		
		newGame.setClickHandler(function(event) {
			
		});
	}
}