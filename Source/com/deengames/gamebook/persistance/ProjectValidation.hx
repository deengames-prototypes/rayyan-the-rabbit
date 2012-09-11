package com.deengames.gamebook.persistance;
import com.deengames.gamebook.model.Project;

/**
 * ...
 * @author ashes999
 */

class ProjectValidation 
{
	private var project:Project;	
	private var validationFailures:String = "";
	
	public function new(p:Project, messages:String) 
	{
		this.project = p;
		this.validationFailures = messages;
	}
	
	public function isValid() : Bool
	{
		return this.validationFailures == "";
	}
	
	public function getProject() : Project
	{
		return this.project;
	}
	
	public function getValidationFailureMessages() : String
	{
		return this.validationFailures;
	}
}