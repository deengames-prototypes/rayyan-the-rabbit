package com.deengames.gamebook.persistance;
using com.blastcube.extensions.StringExtensions;
import com.blastcube.core.exception.Exception;
import com.deengames.gamebook.model.Project;
import com.deengames.gamebook.model.Scene;
import haxe.xml.Fast;
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
	
	/**
	 * Loads the project given the filename (automatically prepends /assets if not prepended).
	 * If the project file doesn't exist, or the contents are not valid, this method throws
	 * an exception. Otherwise, it returns the de-serialized Project instance.
	 * @param	fileName the path and file of the project file.
	 * @return the deserialized project instance (if the contents are valid).
	 */
	public function loadProject(fileName:String) : Project
	{
		var fullPath = fileName;
		if (!fullPath.startsWith("assets/")) {
			fullPath = "assets/" + fileName;
		}
		
		var content = Assets.getText(fullPath);
		if (content == null || content == "") {
			throw new Exception("Can't read project file: " + fullPath);
		} else {		
			return deserializeProject(content);
		}
	}
	
	public function deserializeProject(content:String) : Project
	{
		var fast:Fast = new Fast(Xml.parse(content));
			
		// Extract details from XML. No XPath here...
		var projectName:String = fast.node.project.att.name;
		var scenesFile:String = fast.node.project.att.scenesFile;
		
		if (scenesFile == null || scenesFile == "") {
			throw new Exception("Invalid <project> tag: 'scenesFile' attribute is missing.");
		}
		
		var toReturn:Project = new Project(projectName, scenesFile);
		
		for (scene in fast.node.project.nodes.scene) {
			var name:String = scene.att.name;
			var bg:String = scene.att.background;
			var text:String = scene.att.text;
			var bgAudio:String = "";
			
			if (scene.has.backgroundAudio) {
				bgAudio = scene.att.backgroundAudio;
			}
			
			if (bg == "") {
				throw new Exception("Scene " + name + " is missing a background.");
			}
			
			if (text == "") {
				throw new Exception("Scene " + name + " is missing text.");
			}
			
			toReturn.addScene(new Scene(name, bg, text, bgAudio));
		}
		
		return toReturn;
	}
	
}