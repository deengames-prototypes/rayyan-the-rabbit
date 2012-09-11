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

	public function getPathRelativeToAssetsDir(fileName:String) : String
	{
		if (!fileName.startsWith("/assets/")) {
			fileName = "/assets/" + fileName;
		} else if (!fileName.startsWith("/")) {
			fileName = "/assets/" + fileName;
		} else {
			fileName = "/assets" + fileName;
		}
		
		return fileName;
	}
	
	public function loadProject(fileName:String) : Project
	{
		//var fullPath = getPathRelativeToAssetsDir(fileName);
		var content = Assets.getText(fileName);
		if (content == "") {
			throw "No content?!";
		} else {
			throw "Got it: " + content;
		}
		
		return new Project("Unreachable code");
	}
	
}