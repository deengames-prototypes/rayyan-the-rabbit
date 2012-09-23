package com.deengames.gamebook.model;

/**
 * ...
 * @author 
 */

class Scene 
{

	public var name(getName, null):String;
	public var background(getBackground, null):String;	
	public var text(getText, null) : String;
	public var backgroundAudio(getBackgroundAudio, null) : String;
	public var hasBackgroundAudio(getHasBgAudio, null) : Bool;
	
	public function new(name:String, background:String, text:String, backgroundAudio:String = "") 
	{
		this.name = name;
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
	
	private function getHasBgAudio() : Bool
	{
		return this.backgroundAudio != "";
	}
}