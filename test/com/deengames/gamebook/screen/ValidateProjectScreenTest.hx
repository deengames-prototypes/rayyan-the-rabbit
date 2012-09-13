package com.deengames.gamebook.screen;

import com.blastcube.controls.ThreeScaleButton;
import com.blastcube.core.exception.Exception;
import com.blastcube.core.Game;
import com.blastcube.testutils.ScreenTestBase;
import com.deengames.gamebook.Square;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.Lib;
import nme.text.TextField;
import massive.munit.Assert;

/**
 * ...
 * @author ashes999
 */

class ValidateProjectScreenTest
{
	public function new()
	{
		Lib.current.stage.addChild(BitmapCache.get(Square));
		
	}
	
	@Test
	public function constructorThrowsExceptionIfProjectFileIsInvalid() {
		try {
			var screen:ValidateProjectScreen = new ValidateProjectScreen("Invalid.xml");
			Assert.fail("Never saw an exception");
		} catch (e:Exception) {
			// Pass
			Assert.isTrue(true);
		}
	}
}