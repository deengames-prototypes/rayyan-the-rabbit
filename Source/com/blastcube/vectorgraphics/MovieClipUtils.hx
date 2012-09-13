package com.blastcube.vectorgraphics;


import com.blastcube.core.exception.Exception;
import format.SWF;
import format.swf.MovieClip;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.IBitmapDrawable;
import nme.display.PixelSnapping;
import nme.display.Sprite;
import nme.geom.Matrix;
import nme.geom.Rectangle;

/**
 * ...
 * @author Mike Cann
 */

class MovieclipUtils 
{

	public static function getScaledBitmap(symbol : SWF, symbolName:String, scale:Float=1, pixelSnap:Bool=true) : Sprite
	{
		var toReturn:Sprite = new Sprite();
		//scale *= Consts.GAME_SCALE;
		
		// Work out the bounds of this mc
		var r:Rectangle = new Rectangle(0, 0, symbol.width, symbol.height);
			
		// Make a matrix for the draw
		var m:Matrix = new Matrix();
		m.scale(scale, scale);
		m.translate( Math.round(1 - r.x * scale), Math.round(1 - r.y * scale));				
		
		// Make the BMD and draw
		var idealW:Float = (r.width * scale);
		var idealH:Float = (r.height * scale);
		var bmd:BitmapData = new BitmapData(Std.int(idealW), Std.int(idealH), true, 0);					
		
		m.translate(bmd.width - idealW, bmd.height - idealH);			
		//var sourceBitmapData:BitmapData = symbol.getBitmapData("Square");
		var sourceBitmapData:Sprite = symbol.createMovieClip(symbolName);
		
		if (sourceBitmapData == null) {
			throw new Exception("Can't get symbol: " + symbolName);
		}
		
		bmd.draw(sourceBitmapData , m);
		
		var b:Bitmap = new Bitmap(bmd, pixelSnap ? PixelSnapping.AUTO : PixelSnapping.NEVER);
		b.x = -m.tx;
		b.y = -m.ty;
				
		toReturn.addChild(b);
		
		return toReturn;		
	}
}