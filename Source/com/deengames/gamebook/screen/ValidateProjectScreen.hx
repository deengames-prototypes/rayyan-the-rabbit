package com.deengames.gamebook.screen;
import com.blastcube.core.Screen;
import com.deengames.gamebook.model.Project;
import com.deengames.gamebook.persistance.PersistanceMediator;
import com.deengames.gamebook.persistance.ProjectValidation;

/**
 * ...
 * @author 
 */

class ValidateProjectScreen extends Screen
{
	public function new(fileName:String) 
	{	
		super();
		
		var project:ProjectValidation = new PersistanceMediator().loadProject(fileName);
		if (project.isValid()) {
			// Show first screen; pass entire project to the StoryScreen?
		} else {
			throw "Invalid project: " + project.getValidationFailureMessages();
		}
	}
}