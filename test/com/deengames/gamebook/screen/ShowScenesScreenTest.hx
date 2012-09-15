package com.deengames.gamebook.screen;

import com.blastcube.core.exception.Exception;
import massive.munit.Assert;

/**
 * ...
 * @author ashes999
 */

class ShowScenesScreenTest
{
	public function new()
	{
		
	}
	
	@Test
	public function constructorThrowsExceptionIfProjectFileIsInvalid() {
		try {
			var screen:ShowScenesScreen = new ShowScenesScreen("Invalid.xml");
			Assert.fail("Never saw an exception");
		} catch (e:Exception) {
			// Pass
			Assert.isTrue(true);
		}
	}
}