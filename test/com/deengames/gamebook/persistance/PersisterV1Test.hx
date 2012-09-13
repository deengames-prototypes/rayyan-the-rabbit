package com.deengames.gamebook.persistance;
import com.deengames.gamebook.model.Project;
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
			"	<scene name=\"Scene 1\" background=\"\" />" +
			"	<scene name=\"Scene 2\" background=\"\" />" +
			"</project>");
			
		Assert.areEqual("Rayyan the Rabbit", project.name);
	}
	
}