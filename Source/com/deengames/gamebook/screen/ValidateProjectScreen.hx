package com.deengames.gamebook.screen;
import com.blastcube.core.Screen;
import com.deengames.gamebook.model.Project;

/**
 * ...
 * @author 
 */

class ValidateProjectScreen extends Screen
{
	public function new(fileName:String) 
	{
		var project:Project = new PersistanceMediator().loadProject(fileName);
	}
}