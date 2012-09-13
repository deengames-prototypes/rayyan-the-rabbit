package com.blastcube.vectorgraphics;


import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.MovieClip;
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

	public static function getScaledBitmap(symbol : Sprite, scale:Float=1, pixelSnap:Bool=true) : Sprite
	{
		var container = new Sprite();
		//scale *= Consts.GAME_SCALE;
		
		// Work out the bounds of this mc
		var r = new Rectangle(0, 0, symbol.width, symbol.height);
			
		// Make a matrix for the draw
		var m = new Matrix();
		m.scale(scale, scale);
		m.translate( Math.round(1 - r.x * scale), Math.round(1 - r.y * scale));				
		
		// Make the BMD and draw
		var idealW = 2+r.width*scale;
		var idealH = 2+ r.height*scale;
		var bmd = new BitmapData(Std.int(idealW), Std.int(idealH), true, 0);					
		
		m.translate(bmd.width-idealW, bmd.height-idealH);			
		bmd.draw(symbol, m);
		
		var b = new Bitmap(bmd,pixelSnap?PixelSnapping.AUTO:PixelSnapping.NEVER);
		b.x = -m.tx;
		b.y = -m.ty;
				
		container.addChild(b);
		
		return container;		
	}
}