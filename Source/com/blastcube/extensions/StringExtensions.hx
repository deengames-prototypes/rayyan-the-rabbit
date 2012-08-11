package com.blastcube.extensions;
using com.blastcube.extensions.StringExtensions;

/**
 * ...
 * @author ashes999
 */

class StringExtensions 
{
	private function new() { }
	
	public static function startsWith(target:String, value:String) : Bool {
		return target.indexOf(value) == 0;		
	}
	
	public static function endsWith(target:String, value:String) : Bool {
		var i:Int = target.lastIndexOf(value);
		var t:Int = target.length;
		var v:Int = value.length;
		
		return target.lastIndexOf(value) == target.length - value.length;		
	}
	
	public static function trim(target:String) : String {
		var toReturn:String = target;
		
		while (toReturn.startsWith("\n")) {
			toReturn = toReturn.substr(1);
		}		
		
		while (toReturn.endsWith("\n")) {
			toReturn = toReturn.substr(0, toReturn.length - 1);
		}
		
		return toReturn;
	}
	
	public static function contains(target:String, value:String) : Bool {
		return target.indexOf(value) > -1;
	}
}