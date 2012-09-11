package com.deengames.gamebook;

import com.blastcube.controls.ThreeScaleButtonTest;
import com.blastcube.core.Game;
import com.blastcube.core.Screen;
import com.deengames.gamebook.screen.TitleScreen;
import com.deengames.gamebook.screen.ValidateProjectScreen;

/**
 * @author ashes999
 */
class GameBookMain extends Game {
	
	private var currentScreen:Screen;
	public static var projectFileName = "Rayyan the Rabbit.xml";
	
	public function new () {
		super();
	}
	
	// Entry point
	public static function main () {
		Game.showScreen(new ValidateProjectScreen(projectFileName));
		//Game.showScreen(new TitleScreen());
		
		// Run some tests instead -- use to debug tests
		//var test = new ThreeScaleButtonTest();
		//test.setup();
		//test.initAddsImagesAndTextFieldToButtonAndButtonToScreen();
	}
}