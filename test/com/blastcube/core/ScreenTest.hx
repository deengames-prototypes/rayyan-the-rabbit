package com.blastcube.core;

import com.blastcube.core.Screen;
import com.blastcube.testutils.ScreenTestBase;
import nme.display.Sprite;
import nme.Lib;
import nme.text.TextField;
import massive.munit.Assert;
import nme.display.Bitmap;

/**
 * ...
 * @author ashes999
 */

class ScreenTest extends ScreenTestBase
{	
	public function new() { 
			super();
	}
	
	@Test
	public function addTextFieldAddsTextFieldToStage() : Void {
		testScreen.addTextField("Hi mom!", "HelloWorld");
		var hello:TextField = cast(testScreen.getChildByName("HelloWorld"), TextField);
		Assert.isNotNull(hello);
	}
	
	@Test
	public function addTextFieldCreatesFieldWithCurrentStageStageWidth() : Void {
		var hello:TextField = testScreen.addTextField("Hi mom!");
		Assert.areEqual(Lib.current.stage.stageWidth, hello.width);
	}
	
	@Test
	public function addTextFieldCreatesUnselectableTextFields() : Void {
		var hello:TextField = testScreen.addTextField("Hi mom!");
		Assert.areEqual(false, hello.selectable);
	}
	
	@Test
	public function disposeRemovesTextFieldsFromStage() : Void {
		testScreen.addTextField("Hi mom!", "Hello 1");
		testScreen.addTextField("Hi mom!!", "Hello 2");
		
		testScreen.dispose();
		
		var hello1:TextField = cast(testScreen.getChildByName("Hello 1"), TextField);
		var hello2:TextField = cast(testScreen.getChildByName("Hello 2"), TextField);
		
		Assert.isNull(hello1);
		Assert.isNull(hello2);
	}
	
	
	@Test
	public function addImageAddsImageToStage() : Void {
		testScreen.addImage("assets/common/starfield.jpg", "starfield");
		var starfield:Sprite = cast(testScreen.getChildByName("starfield"), Sprite);
		Assert.isNotNull(starfield);
	}	
	
	@Test
	public function disposeRemovesImagesFromStage() : Void {
		testScreen.addImage("assets/common/starfield.jpg", "starfield");
		
		testScreen.dispose();
		
		var starfield:Sprite = cast(testScreen.getChildByName("starfield"), Sprite);
		Assert.isNull(starfield);
	}
}