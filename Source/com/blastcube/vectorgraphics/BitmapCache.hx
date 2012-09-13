package com.blastcube.vectorgraphics;

import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.Sprite;


/**
 * ...
 * @author Mike Cann
 */

class BitmapCache 
{
	public static var cache : Array<BitCacheVO> = [];

	public static function get(clazz:Class<Dynamic>) : BitmapData
	{
		var s : Sprite = null;
		for (vo in cache) if (vo.clazz == clazz) return vo.bitmap;
		s = MovieclipUtils.getScaledBitmap(Type.createInstance(clazz,[]));
		var newVO = new BitCacheVO();
		newVO.clazz = clazz;
		var bmd =  cast(s.getChildAt(0), Bitmap).bitmapData;
		newVO.bitmap = bmd;
		cache.push(newVO);
		return bmd;
	}
	
	static public function getAndWrap(clazz:Class<Dynamic>, scale:Float=1) : Sprite
	{
		var s = new Sprite();
		s.addChild(new Bitmap(get(clazz)));
		s.scaleX = s.scaleY = scale;
		return s;
	}
	
}

class BitCacheVO
{
	public var clazz : Class<Dynamic>;
	public var bitmap : BitmapData;	
	public function new() {}
}