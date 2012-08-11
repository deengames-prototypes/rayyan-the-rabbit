package com.deengames.rayyantherabbit.screen;

import com.blastcube.controls.ThreeScaleButton;
import com.blastcube.core.Game;
import com.blastcube.testutils.ScreenTestBase;
import com.deengames.rayyantherabbit.screen.TitleScreen;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.Lib;
import nme.text.TextField;
import massive.munit.Assert;

/**
 * ...
 * @author ashes999
 */

class TitleScreenTest
{
	public function new() { }
	
	@Test
	public function initAddsBackgroundImage() {
		var screen:TitleScreen = new TitleScreen();
		Game.showScreen(screen);
		screen.init();
		
		var background:Sprite = cast(screen.getChildByName("background"), Sprite);
		Assert.isNotNull(background);	
	}
	
	@Test
	public function initAddsTitleTextImage() {
		var screen:TitleScreen = new TitleScreen();
		Game.showScreen(screen);
		screen.init();
		
		var title:Sprite = cast(screen.getChildByName("title text"), Sprite);
		Assert.isNotNull(title);	
	}
	
	@Test
	public function initAddsNewGameButton() {
		var screen:TitleScreen = new TitleScreen();
		Game.showScreen(screen);
		screen.init();
		
		var newGameButton:ThreeScaleButton = cast(screen.getChildByName("newgame"), ThreeScaleButton);
		var textField:TextField = cast(newGameButton.getChildByName("text"), TextField);
		Assert.isNotNull(textField);	
		Assert.areEqual("New Game", textField.text);
	}
}