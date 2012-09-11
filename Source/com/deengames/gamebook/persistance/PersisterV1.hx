package com.deengames.gamebook.persistance;
using com.blastcube.extensions.StringExtensions;
import com.deengames.gamebook.model.Project;
import nme.Assets;

/**
 * ...
 * @author 
 */

class PersisterV1 
{

	public function new() 
	{
		
	}
	
	public function loadProject(fileName:String) : ProjectValidation
	{
		var fullPath = fileName;
		if (!fullPath.startsWith("assets/")) {
			fullPath = "assets/" + fileName;
		}
		
		var content = Assets.getText(fileName);
		if (content == null || content == "") {
			throw "No content?!";
		} else {
			throw "Got it: " + content;
		}
		
		return new ProjectValidation(new Project("HI"), "Unreachable code");
	}
	
}