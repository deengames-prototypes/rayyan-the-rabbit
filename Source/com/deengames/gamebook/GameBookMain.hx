package com.deengames.gamebook;

import com.blastcube.controls.ThreeScaleButtonTest;
import com.blastcube.core.Game;
import com.blastcube.core.Screen;
import com.deengames.gamebook.screen.ShowScenesScreen;
import com.deengames.gamebook.screen.TitleScreen;

/**
 * @author ashes999
 */
class GameBookMain extends Game {
	
	private var currentScreen:Screen;
	
	public static var projectFileName = "RayyanTheRabbit.xml";
	private static var titleScreenSwf = "assets/swf/titlescreen.swf";
	private static var titleScreenSymbolName = "titlescreen";
	
	public function new () {
		super();
	}
	
	// Entry point
	public static function main () {
		Game.showScreen(new TitleScreen(titleScreenSwf, titleScreenSymbolName));
		
		// Run some tests instead -- use to debug tests
		//var test = new VectorImageFactoryTest();
		//test.setup();
		//test.getRasterizedImageMakesImageAtLeastSizeIfRasterizeIsMinimum();
	}
}