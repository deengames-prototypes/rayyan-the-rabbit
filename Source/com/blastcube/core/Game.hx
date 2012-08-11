package com.blastcube.core;
import nme.display.Sprite;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.Lib;
import nme.text.TextField;

/**
 * ...
 * @author ashes999
 */

class Game
{

	private static var currentScreen:Screen;
	
	public function new() 
	{
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
	}
	
	public static function showScreen(screen:Screen) : Void { 
		if (currentScreen != null) {
			currentScreen.dispose();			
			Lib.current.stage.removeChild(currentScreen);
		}		
		
		currentScreen = screen;
		screen.init();
		Lib.current.stage.addChild(currentScreen);
	}
	
	public static function getCurrentScreen() : Screen {
		return Game.currentScreen;
	}
}