package com.blastcube.vectorgraphics;


import com.blastcube.core.exception.Exception;
import format.SWF;
import format.swf.MovieClip;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.IBitmapDrawable;
import nme.display.PixelSnapping;
import nme.display.Sprite;
import nme.geom.Matrix;
import nme.geom.Rectangle;

/**
 * ...
 * Inspired by Mike Cann's "MovieclipUtils" class (Mr. Nibbles Week 3 code)
 */

class VectorImageFactory 
{

	private static var cachedRasterizedImages:Hash<BitmapData> = new Hash<BitmapData>();
	public static var isCachingEnabled:Bool = false;
	
	/**
	 * Loads an image from an SWF. 
	 * @param	swfName the filename of the SWF in assets to load.
	 * @param	symbolName the symbol name in the SWF to load.
	 * @return a vector image (Sprite) instance of the symbol.
	 */
	public static function loadImage(swfName:String, symbolName:String) : Sprite
	{
		var symbol:SWF;
		try {
			symbol = new SWF(Assets.getBytes(swfName)); 
		} catch (exception:Dynamic) {
			throw new Exception("Can't load SWF: " + swfName);
		}
		
		if (symbol == null) {
			throw new Exception("Can't load SWF: " + swfName);
		}

		var sourceBitmapData:Sprite = symbol.createMovieClip(symbolName);
		
		if (sourceBitmapData == null) {
			throw new Exception("Can't get symbol " + symbolName + " from " + swfName);
		}
		
		return sourceBitmapData;
	}
	
	public static function getRasterizedImage(swfName:String, symbolName:String, resize:Resize, width:Int = 0, height:Int = 0) : Sprite
	{
		// Lets imagine we have a 450x600 symbol in an 800x600 stage in Flash.
		// symbol is [800x600]
		// sourceBitmapData is [450x600]
		// We want to see the latter sizes, not the former!
		var sourceBitmapData:Sprite = loadImage(swfName, symbolName);
		var toReturn:Sprite = new Sprite();
		
		// Work out the bounds of this mc
		var r:Rectangle = new Rectangle(0, 0, sourceBitmapData.width, sourceBitmapData.height);
		
		var scale:Float = 1;
		
		if (!Type.enumEq(resize, NoResize) && width > 0 && height > 0) {
			var scaleW:Float = width / sourceBitmapData.width;
			var scaleH:Float = height / sourceBitmapData.height;
			
			if (Type.enumEq(resize, Resize.AtLeast)) {
				scale = Math.max(scaleW, scaleH);
			} else if (Type.enumEq(resize, Resize.AtMost)) {
				scale = Math.min(scaleW, scaleH);
			}
		}
		
		var bmd:BitmapData = null;
		if (isCachingEnabled) {
			bmd = getCachedBitmapData(swfName, symbolName, scale);
		}
		
		var idealW:Float = (r.width * scale);
		var idealH:Float = (r.height * scale);		
		
		if (bmd == null) {
			// Cache miss. Create it.			
			// Make the BMD and draw			
			bmd = new BitmapData(Std.int(idealW), Std.int(idealH), true, 0);	
			if (isCachingEnabled) {
				cache(swfName, symbolName, scale, bmd);
			}
		}
			
		// Make a matrix for the draw
		var m:Matrix = new Matrix();
		m.scale(scale, scale);
		m.translate( Math.round(1 - r.x * scale), Math.round(1 - r.y * scale));			
		m.translate(bmd.width - idealW, bmd.height - idealH);					
		
		bmd.draw(sourceBitmapData, m);
		
		var b:Bitmap = new Bitmap(bmd, PixelSnapping.AUTO);
		b.name = "Bitmap";
		b.x = -m.tx;
		b.y = -m.ty;
				
		toReturn.addChild(b);
		
		return toReturn;		
	}
	
	private static function getCachedBitmapData(swfName:String, symbolName:String, scale:Float) : BitmapData
	{
		var cacheName:String = getCacheName(swfName, symbolName, scale);
		
		if (cachedRasterizedImages.exists(cacheName)) {
			return cachedRasterizedImages.get(cacheName);
		} else {
			return null;
		}		
	}
	
	private static function cache(swfName:String, symbolName:String, scale:Float, data:BitmapData) : Void
	{
		var cacheName:String = getCacheName(swfName, symbolName, scale);
		
		cachedRasterizedImages.set(cacheName, data); // Overwrites if was existing, which is fine
	}
	
	private static function getCacheName(swfName:String, symbolName:String, scale:Float) : String
	{
		return swfName + "->" + symbolName + " x" + scale;
	}
}