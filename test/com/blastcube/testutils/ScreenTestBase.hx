package com.blastcube.testutils;
import com.blastcube.core.Game;
import com.blastcube.core.Screen;

/**
 * ...
 * @author ashes999
 */

class ScreenTestBase
{	
	private var testScreen:Screen;

	public function new() { }
	
	@Before
	public function setup() : Void {
		testScreen = new Screen();
		Game.showScreen(testScreen);
	}	
}