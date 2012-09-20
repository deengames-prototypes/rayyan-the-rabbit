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
	
	public function new(name:String, background:String, text:String) 
	{
		this.name = name;
		this.text = text;
		this.background = background;
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
}