package com.deengames.gamebook.screen;
import com.blastcube.core.Screen;
import com.deengames.gamebook.model.Project;
import com.deengames.gamebook.persistance.PersistanceMediator;

/**
 * ...
 * @author 
 */

class ValidateProjectScreen extends Screen
{
	public function new(fileName:String) 
	{	
		super();
		
		// Any validation failures will throw an exception here
		var project:Project = new PersistanceMediator().loadProject(fileName);
		// Show first screen; pass entire project to the StoryScreen?
	}
}