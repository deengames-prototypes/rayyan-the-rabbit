package com.blastcube.controls;
import com.blastcube.core.Game;
import com.blastcube.core.Screen;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.events.Event;
import nme.events.MouseEvent;
import nme.Lib;
import nme.text.TextField;
import nme.text.TextFieldAutoSize;
import nme.text.TextFormat;

using com.blastcube.extensions.TextFieldExtensions;

/**
 * ...
 * @author ashes999
 */

class ThreeScaleButton extends Sprite
{

	private var leftImage:Sprite;
	private var centerImage:Sprite;
	private var rightImage:Sprite;
	private var textField:TextField;
	private var clickHandler:Dynamic -> Void;
	
	public function new(caption:String) 
	{
		super();
		
		var currentScreen:Screen = Game.getCurrentScreen();
		
		// Methodology: don't call the Screen.addImage method, because users expect that to list all
		// the images they added -- not images we use internally. So add stuff directly.
		
		this.leftImage = new Sprite();
		this.leftImage.addChild(createBitmap("assets/controls/button-click-left.png", "Clicked"));
		this.leftImage.addChild(createBitmap("assets/controls/button-left.png", "Normal"));
		this.leftImage.name = "left";
		
		this.centerImage = new Sprite();
		this.centerImage.addChild(createBitmap("assets/controls/button-click-middle.png", "Clicked"));
		this.centerImage.addChild(createBitmap("assets/controls/button-middle.png", "Normal"));
		this.centerImage.name = "center";
		
		this.textField = new TextField();
		this.textField.text = caption;
		this.textField.name = "text";
		this.textField.selectable = false;
		this.textField.autoSize = TextFieldAutoSize.LEFT;
		this.textField.textColor = 0xFFFFFF;
		this.textField.setFont("Arial");
		
		this.rightImage = new Sprite();
		this.rightImage.addChild(createBitmap("assets/controls/button-click-right.png", "Clicked"));
		this.rightImage.addChild(createBitmap("assets/controls/button-right.png", "Normal"));
		this.rightImage.name = "right";
		
		this.addChild(this.leftImage);
		this.addChild(this.centerImage);
		this.addChild(this.rightImage);
		this.addChild(this.textField);
		
		this.leftImage.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
		this.centerImage.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
		this.rightImage.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
		this.textField.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
		
		this.leftImage.addEventListener(MouseEvent.MOUSE_UP, restoreNormalImages);
		this.centerImage.addEventListener(MouseEvent.MOUSE_UP, restoreNormalImages);
		this.rightImage.addEventListener(MouseEvent.MOUSE_UP, restoreNormalImages);
		this.textField.addEventListener(MouseEvent.MOUSE_UP, restoreNormalImages);
		
		this.setX(0);
		this.setY(0);
	}
	
	public function setClickHandler(handler:Dynamic -> Void) : Void {
		this.clickHandler = handler;
	}
	
	public function removeClickHandler() : Void {
		this.setClickHandler(null);
	}
	
	// Primarily for testing :)
	public function click() : Void {
		this.onClick(null);
	}
	
	private function onClick(event:Event) : Void {
		if (this.clickHandler != null) {
			this.clickHandler(event);
			showClickedImages();
		}
	}
	
	public function setX(x:Float) : Void {
		this.leftImage.x = x;
		this.centerImage.x = this.leftImage.x + this.leftImage.width;
		this.centerImage.scaleX = this.textField.textWidth;
		this.rightImage.x = this.centerImage.x + this.centerImage.width;
		
		this.textField.x = this.centerImage.x + ((this.centerImage.width - this.textField.textWidth) / 2);		
	}
	
	public function setY(y:Float) : Void {
		this.leftImage.y = y;
		this.centerImage.y = y;
		this.rightImage.y = y;
		this.textField.y = this.centerImage.y + ((this.centerImage.height - this.textField.textHeight) / 3);
	}
	
	public function getWidth() : Int {
		return Std.int(this.leftImage.width + this.centerImage.width + this.rightImage.width);
	}
	
	public function getHeight() : Int {
		return Std.int(this.leftImage.height);
	}
	
	public function dispose() : Void {
		var currentScreen:Screen = Game.getCurrentScreen();
		
		this.removeChild(this.leftImage);
		this.removeChild(this.centerImage);
		this.removeChild(this.rightImage);
		this.removeChild(this.textField);
	}
	
	private function createBitmap(fileName:String, name:String) : Bitmap {
		var toReturn:Bitmap = new Bitmap(Assets.getBitmapData(fileName));
		toReturn.name = name;
		return toReturn;
	}
	
	private function showClickedImages() : Void {
		this.leftImage.getChildByName("Normal").visible = false;
		this.centerImage.getChildByName("Normal").visible = false;
		this.rightImage.getChildByName("Normal").visible = false;
	}
	
	private function restoreNormalImages(event:Event) : Void {
		this.leftImage.getChildByName("Normal").visible = true;
		this.centerImage.getChildByName("Normal").visible = true;
		this.rightImage.getChildByName("Normal").visible = true;
	}
}