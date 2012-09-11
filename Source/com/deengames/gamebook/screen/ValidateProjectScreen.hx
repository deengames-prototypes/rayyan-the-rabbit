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
		var validationFailureMessages:String = new PersistanceMediator().validateProject(fileName);
		
		if (validationFailureMessages != "") {
			this.addTextField("The project isn't valid. Errors:\n\n" + validationFailureMessages);
		} else {
			var project:Project = new PersistanceMediator().loadProject(fileName);
			// Show first screen; pass entire project to the StoryScreen?
		}
	}
}