package com.blastcube.core;

import com.blastcube.core.Game;
import com.blastcube.core.Screen;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.Lib;
import nme.text.TextField;
import massive.munit.Assert;

/**
 * ...
 * @author ashes999
 */

class GameTest
{
	public function new() { }
	
	@Test
	public function newAlignsToTopLeftWithNoScale() : Void {
		new Game();
		Assert.areEqual(StageAlign.TOP_LEFT, Lib.current.stage.align);
		Assert.areEqual(StageScaleMode.NO_SCALE, Lib.current.stage.scaleMode);
	}
	
	@Test
	public function showScreenCallsDisposeOnOldScreen() : Void {
		// Dispose destroys text fields. So use that to test.
		var s1:Screen = new Screen();		
		s1.addTextField("Hi mom!", "Hello");
		Game.showScreen(s1);
		var hello:TextField = cast(s1.getChildByName("Hello"), TextField);
		Assert.isNotNull(hello);
		
		var s2:Screen = new Screen();
		Game.showScreen(s2);
		
		hello = cast(Lib.current.stage.getChildByName("Hello"), TextField);
		Assert.isNull(hello);
	}
	
	@Test
	public function getCurrentScreenGetsCurrentScreen() : Void {
		var screen:Screen = new Screen();
		Game.showScreen(screen);
		Assert.areEqual(screen, Game.getCurrentScreen());
	}
}