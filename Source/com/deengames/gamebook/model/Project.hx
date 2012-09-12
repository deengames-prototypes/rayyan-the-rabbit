package com.deengames.gamebook.model;

/**
 * ...
 * @author 
 */

class Project 
{

	private var scenes:List<Scene>;
	private var name:String = "";
	
	public function new(name:String) 
	{
		this.name = name;
		this.scenes = new List<Scene>();
	}
	
	public function addScene(s:Scene) {
		this.scenes.add(s);
	}
	
}