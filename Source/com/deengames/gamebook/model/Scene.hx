package com.deengames.gamebook.model;

/**
 * ...
 * @author 
 */

class Scene 
{

	public var name(getName, null):String;
	private var background:String;
	
	public function new(name:String, background:String) 
	{
		this.name = name;
		this.background = background;
	}
	
	private function getName() : String
	{
		return this.name;
	}
	
}