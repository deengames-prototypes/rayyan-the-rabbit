package com.deengames.gamebook.model;
import com.blastcube.extensions.StringExtensions;

/**
 * ...
 * @author 
 */

class Scene 
{

	public var name(getName, null):String;
	public var background(getBackground, null):String;	
	public var narration(getNarration, null):String;
	public var text(getText, null) : String;
	public var backgroundAudio(getBackgroundAudio, null) : String;
	public var hasBackgroundAudio(getHasBgAudio, null) : Bool;
	
	public function new(name:String, background:String, narration:String, text:String, backgroundAudio:String = "") 
	{
		this.name = name;
		this.narration = narration;
		this.text = text;
		this.background = background;
		this.backgroundAudio = backgroundAudio;
	}
	
	private function getName() : String
	{
		return this.name;
	}
	
	private function getBackground() : String
	{
		return this.background;
	}
	
	private function getText() : String
	{
		return this.text;
	}
	
	private function getBackgroundAudio() : String
	{
		return this.backgroundAudio;
	}
	
	private function getNarration() : String
	{
		return this.narration;
	}
	
	private function getHasBgAudio() : Bool
	{
		return this.backgroundAudio != "";
	}
}