package com.deengames.gamebook;

import com.blastcube.controls.ThreeScaleButtonTest;
import com.blastcube.core.Game;
import com.blastcube.core.Screen;
import com.deengames.gamebook.screen.TitleScreen;

/**
 * @author ashes999
 */
class GameBookMain extends Game {
	
	private var currentScreen:Screen;
	
	public function new () {
		super();
	}
	
	// Entry point
	public static function main () {
		Game.showScreen(new TitleScreen());
		
		// Run some tests instead -- use to debug tests
		//var test = new ThreeScaleButtonTest();
		//test.setup();
		//test.initAddsImagesAndTextFieldToButtonAndButtonToScreen();
	}
}