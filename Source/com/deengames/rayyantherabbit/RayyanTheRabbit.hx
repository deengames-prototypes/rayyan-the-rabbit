package com.deengames.rayyantherabbit;

import com.blastcube.controls.ThreeScaleButtonTest;
import com.blastcube.core.Game;
import com.blastcube.core.Screen;
import com.deengames.rayyantherabbit.screen.TitleScreen;
import com.deengames.rayyantherabbit.screen.TitleScreenTest;

/**
 * @author ashes999
 */
class RayyanTheRabbit extends Game {
	
	private var currentScreen:Screen;
	
	public function new () {
		super();
	}
	
	// Entry point
	public static function main () {
		//Game.showScreen(new TitleScreen());
		
		// Run some tests instead -- use to debug tests
		var test = new ThreeScaleButtonTest();
		test.setup();
		test.initAddsImagesAndTextFieldToButtonAndButtonToScreen();
	}
}