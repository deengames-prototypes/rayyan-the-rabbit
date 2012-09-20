package com.deengames.gamebook.model;
import com.blastcube.core.exception.Exception;
import com.blastcube.extensions.BlastList;

/**
 * ...
 * @author 
 */

class Project 
{

	private var scenes:BlastList<Scene>;
	public var name(getName, null) : String;
	public var sceneCount(getSceneCount, null) : Int;
	
	public function new(name:String) 
	{
		this.name = name;
		this.scenes = new BlastList<Scene>();
	}
	
	public function addScene(s:Scene)
	{
		this.scenes.add(s);
	}
	
	public function getScene(n:Int) : Scene
	{
		return this.scenes.get(n);
	}
	
	private function getName() : String
	{
		return this.name;
	}
	
	private function getSceneCount() : Int
	{
		return this.scenes.length;
	}
}