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
	
	// TODO: encapsulate the class and make your own class; hide methods.
	public static function setFont(target:TextField, fontName:String) : Void {
		target.defaultTextFormat = new TextFormat(fontName);
		target.text = target.text; // allows us to change font even after setting text
	}
}