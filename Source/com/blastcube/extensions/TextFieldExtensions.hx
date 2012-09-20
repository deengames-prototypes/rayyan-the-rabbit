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
	
	public static function setFontSize(target:TextField, fontSize:Int) : Void {
		target.defaultTextFormat = new TextFormat(target.getTextFormat().font, fontSize);
		target.text = target.text; // allows us to change font even after setting text
	}
	
	public static function setFontColour(target:TextField, colour:Int) : Void {
		var currentFormat:TextFormat = target.getTextFormat();
		target.defaultTextFormat = new TextFormat(currentFormat.font, currentFormat.size, colour);
		target.text = target.text; // allows us to change font even after setting text
	}
}