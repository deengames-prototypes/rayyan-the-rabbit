package com.deengames.gamebook.model;

/**
 * ...
 * @author 
 */

class Project 
{

	private var scenes:List<Scene> = new List<Scene>();
	private var name:String = "";
	
	public function new(name:String) 
	{
		this.name = name;
	}
	
}