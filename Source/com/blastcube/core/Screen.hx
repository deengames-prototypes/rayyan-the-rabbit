package com.blastcube.core;
import com.blastcube.controls.ThreeScaleButton;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.Lib;
import nme.text.TextField;

/**
 * ...
 * @author ashes999
 */

class Screen extends Sprite
{
	private var textFields:List<TextField>;
	private var images:List<Sprite>;
	private var buttons:List<ThreeScaleButton>;
	
	public function new() 
	{
		super();
		
		this.images = new List();
		this.textFields = new List();
		this.buttons = new List();
	}
	
	public function init() {
		// Override me.
	}
	
	public function dispose() {
		
		for (image in this.images) {
			image.removeChild(image.getChildByName("Bitmap"));
			this.removeChild(image);			
		}
		
		this.images.clear();
		
		for (textField in this.textFields) {
			this.removeChild(textField);
		}		
		
		this.textFields.clear();
		
		for (button in this.buttons) {
			button.dispose();
		}
		
		this.buttons.clear();
	}

	public function addTextField(text:String, name:String = "") : TextField {		
		var toReturn:TextField = new TextField();
		toReturn.text = text;
		toReturn.width = Lib.current.stage.stageWidth;
		toReturn.selectable = false;
		
		toReturn.name = name;
		this.textFields.add(toReturn);
		this.addChild(toReturn);
		return toReturn;
	}
	
	public function addImage(fileName:String, name:String = "") : Sprite {
		var toReturn:Sprite = new Sprite();
		var bitmapData:Bitmap = new Bitmap(Assets.getBitmapData(fileName));
		bitmapData.name = "Bitmap";
		toReturn.addChild(bitmapData);

		toReturn.name = name;
		this.images.add(toReturn);
		this.addChild(toReturn);
		return toReturn;
	}
	
	public function addButton(caption:String) : ThreeScaleButton {
		var toReturn:ThreeScaleButton = new ThreeScaleButton(caption);		
		this.addChild(toReturn);
		return toReturn;
	}
	
	public function fitToScreen(image:Sprite) : Void {
		var scaleWidth:Float = Lib.current.stage.stageWidth / image.width;
		var scaleHeight:Float = Lib.current.stage.stageHeight / image.height;
		
		image.scaleX = Math.max(scaleWidth, scaleHeight);
		image.scaleY = Math.max(scaleWidth, scaleHeight);
	}
}