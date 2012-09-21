package com.blastcube.core;
import com.blastcube.controls.ThreeScaleButton;
import com.blastcube.vectorgraphics.Resize;
import com.blastcube.vectorgraphics.VectorImageFactory;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.DisplayObject;
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
	
	private var _stageW:Int = 0;
	private var _stageH:Int = 0;
	
	public var stageWidth(getStageWidth, null) : Int;
	public var stageHeight(getStageHeight, null) : Int;
	
	public function new() 
	{
		super();
		
		this.images = new List();
		this.textFields = new List();
		this.buttons = new List();
	}
	
	public function init() : Void
	{
		// Override me.
	}
	
	public function dispose() : Void
	{
		for (image in this.images) {
			this.removeImage(image);
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

	public function addTextField(text:String, name:String = "") : TextField
	{		
		var toReturn:TextField = new TextField();
		toReturn.text = text;
		toReturn.width = Lib.current.stage.stageWidth;
		toReturn.selectable = false;
		
		toReturn.name = name;
		this.textFields.add(toReturn);
		this.addChild(toReturn);
		return toReturn;
	}
	
	public function addImage(fileName:String, name:String = "") : Sprite
	{
		var toReturn:Sprite = new Sprite();
		var bitmapData:Bitmap = new Bitmap(Assets.getBitmapData(fileName));
		bitmapData.name = "Bitmap";
		toReturn.addChild(bitmapData);

		toReturn.name = name;
		this.images.add(toReturn);
		this.addChild(toReturn);
		return toReturn;
	}
	
	public function removeImage(image:Sprite) : Void
	{
		var bitmap:DisplayObject = image.getChildByName("Bitmap");
			
		// For non-vectorized, the data is wrapped in this lovely pastry shell.
		if (bitmap != null) {
			image.removeChild(bitmap);
		}
		
		if (image.parent == this) {
			this.removeChild(image);			
		}
	}
	
	public function addRasterizedVector(swfName:String, symbolName:String, resize:Resize, width:Int = 0, height:Int = 0) : Sprite
	{
		var toReturn:Sprite = VectorImageFactory.getRasterizedImage(swfName, symbolName, resize, width, height);		
		this.images.add(toReturn);
		this.addChild(toReturn);
		return toReturn;
	}
	
	public function addButton(caption:String) : ThreeScaleButton
	{
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
	
	private function getStageWidth() : Int
	{
		if (this._stageW == 0) {
			this._stageW = Lib.current.stage.stageWidth; // Expensive
		}
		
		return this._stageW;
	}
	
	private function getStageHeight() : Int
	{
		if (this._stageH == 0) {
			this._stageH = Lib.current.stage.stageHeight; // Expensive
		}
		
		return this._stageH;
	}
}