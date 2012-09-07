package com.deengames.gamebook.persistance;

/**
 * ...
 * @author 
 */

class PersistanceMediator 
{

	public function new() 
	{
		public function loadProject(fileName:String) : Project {
			return new PersisterV1().loadProject(fileName);
		}
	}
	
}