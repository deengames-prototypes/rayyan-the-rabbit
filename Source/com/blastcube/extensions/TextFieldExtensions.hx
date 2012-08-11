package com.blastcube.extensions;
import nme.text.TextField;
import nme.text.TextFormat;

/**
 * ...
 * @author ashes999
 */

class TextFieldExtensions 
{
	private function new() { }
	
	public static function setFont(target:TextField, fontName:String) : Void {
		target.defaultTextFormat = new TextFormat(fontName);
		target.text = target.text; // allows us to change font even after setting text
	}
}