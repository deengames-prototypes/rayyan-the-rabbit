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
 * Forked from Mike Cann's "MovieclipUtils" class (Mr. Nibbles Week 3 code)
 */

class VectorImageFactory 
{

	public static function getRasterizedImage(swfName:String, symbolName:String, resize:Resize, width:Int = 0, height:Int = 0) : Sprite
	{
		// Lets imagine we have a 450x600 symbol in an 800x600 stage in Flash.
		// symbol is [800x600]
		// sourceBitmapData is [450x600]
		var symbol:SWF = new SWF(Assets.getBytes(swfName)); 
		var sourceBitmapData:Sprite = symbol.createMovieClip(symbolName);

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
		
		// Make a matrix for the draw
		var m:Matrix = new Matrix();
		m.scale(scale, scale);
		m.translate( Math.round(1 - r.x * scale), Math.round(1 - r.y * scale));				
		
		// Make the BMD and draw
		var idealW:Float = (r.width * scale);
		var idealH:Float = (r.height * scale);
		var bmd:BitmapData = new BitmapData(Std.int(idealW), Std.int(idealH), true, 0);					
		
		m.translate(bmd.width - idealW, bmd.height - idealH);			
		
		if (sourceBitmapData == null) {
			throw new Exception("Can't get symbol: " + symbolName);
		}
		
		bmd.draw(sourceBitmapData , m);
		
		var b:Bitmap = new Bitmap(bmd, PixelSnapping.AUTO);
		b.x = -m.tx;
		b.y = -m.ty;
				
		toReturn.addChild(b);
		
		return toReturn;		
	}
}