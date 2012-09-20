package com.deengames.gamebook.persistance;
import com.deengames.gamebook.model.Project;
import com.deengames.gamebook.model.Scene;
import massive.munit.Assert;

/**
 * ...
 * @author ashes999
 */

class PersisterV1Test
{

	public function new() {	}
	
	@Test
	public function deserializeProjectReadsAllPropertiesCorrectly() : Void {
		var project:Project = new PersisterV1().deserializeProject(
			"<project fileVersion=\"1\" name=\"Rayyan the Rabbit\">" +
			"	<scene name=\"Scene 1\" background=\"assets/swf/scene1.swf\" text=\"Hi mom!\" />" +
			"	<scene name=\"Scene 2\" background=\"\" text=\"\" />" +
			"</project>");
			
		Assert.areEqual("Rayyan the Rabbit", project.name);
		Assert.areEqual(2, project.sceneCount);
		
		var s1:Scene = project.getScene(0);
		Assert.areEqual("Scene 1", s1.name);
		Assert.areEqual("assets/swf/scene1.swf", s1.background);
		Assert.areEqual("Hi mom!", s1.text);
	}
	
}