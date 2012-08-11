package com.blastcube.controls;
import com.blastcube.core.Game;
import com.blastcube.core.Screen;
import com.blastcube.testutils.ScreenTestBase;
import massive.munit.Assert;
import nme.display.Sprite;
import nme.Lib;
import nme.text.TextField;

/**
 * ...
 * @author ashes999
 */

class ThreeScaleButtonTest extends ScreenTestBase
{
	public function new() 
	{
		super();
	}
	
	@Test
	public function initAddsImagesAndTextFieldToButtonAndButtonToScreen() : Void {
		testScreen.addButton("Click me!").name = "click";
		var actual:ThreeScaleButton = cast(testScreen.getChildByName("click"), ThreeScaleButton);
		
		Assert.isNotNull(cast(actual.getChildByName("left"), Sprite));
		Assert.isNotNull(cast(actual.getChildByName("center"), Sprite));
		Assert.isNotNull(cast(actual.getChildByName("right"), Sprite));
		Assert.isNotNull(cast(actual.getChildByName("text"), TextField));
	}
	
	@Test
	public function disposeRemovesImagesAndTextFromButton() : Void {
		var button:ThreeScaleButton = new ThreeScaleButton("Click me!");
		button.name = "click";
		button.dispose();
		
		Assert.isNull(cast(button.getChildByName("left"), Sprite));
		Assert.isNull(cast(button.getChildByName("center"), Sprite));
		Assert.isNull(cast(button.getChildByName("right"), Sprite));
		Assert.isNull(cast(button.getChildByName("text"), TextField));
	}
	
	@Test
	public function xCoordinatesLineUp() : Void {
		var button:ThreeScaleButton = new ThreeScaleButton("Clicky!");
		
		var left:Sprite = cast(button.getChildByName("left"), Sprite);
		var center:Sprite = cast(button.getChildByName("center"), Sprite);
		var right:Sprite = cast(button.getChildByName("right"), Sprite);
		var text:TextField = cast(button.getChildByName("text"), TextField);
		
		Assert.areEqual(center.x, left.x + left.width);
		Assert.areEqual(right.x, center.x + center.width);
	}
	
	@Test
	public function getWidthReturnsFullButtonWidth() : Void {
		var button:ThreeScaleButton = new ThreeScaleButton("Clicky!");
		var left:Sprite = cast(button.getChildByName("left"), Sprite);
		var center:Sprite = cast(button.getChildByName("center"), Sprite);
		var right:Sprite = cast(button.getChildByName("right"), Sprite);
		Assert.areEqual(left.width + center.width + right.width, button.getWidth());
	}
	
	@Test
	public function getHeightReturnsHeightOfAnyButtonImage() : Void {
		var button:ThreeScaleButton = new ThreeScaleButton("Clicky!");
		var left:Sprite = cast(button.getChildByName("left"), Sprite);
		var center:Sprite = cast(button.getChildByName("center"), Sprite);
		var right:Sprite = cast(button.getChildByName("right"), Sprite);
		Assert.areEqual(left.height, button.getHeight());
		Assert.areEqual(center.height, button.getHeight());
		Assert.areEqual(right.height, button.getHeight());
	}
	
	@Test
	public function clickFiresClickHandlerMethod() : Void {
		var button:ThreeScaleButton = new ThreeScaleButton("Clicky!");
		var n:Int = 0;
		
		button.setClickHandler(function(event) {
			n++;
		});
		
		button.click();
		
		Assert.areEqual(1, n);
	}
	
	@Test
	public function removeClickHandlerRemovesClickHandler() : Void {
		var button:ThreeScaleButton = new ThreeScaleButton("Clicky!");
		var n:Int = 0;
		
		button.setClickHandler(function(event) {
			n++;
		});
		
		button.removeClickHandler();
		button.click();
		
		Assert.areEqual(0, n);
	}
}