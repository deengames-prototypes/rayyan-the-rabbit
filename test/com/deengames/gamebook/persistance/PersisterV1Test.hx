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
	public function deserializeProjectReadsAllPropertiesCorrectly() : Void
	{
		var project:Project = new PersisterV1().deserializeProject(
			"<project fileVersion=\"1\" name=\"Rayyan the Rabbit\" scenesFile=\"scenes.swf\">" +
			"	<scene name=\"Scene 1\" background=\"beach\" text=\"Hi mom!\" />" +
			"	<scene name=\"Scene 2\" background=\"scene2\" text=\"...\" />" +
			"</project>");
			
		Assert.areEqual("Rayyan the Rabbit", project.name);
		Assert.areEqual(2, project.sceneCount);
		
		var s1:Scene = project.getScene(0);
		Assert.areEqual("Scene 1", s1.name);
		Assert.areEqual("beach", s1.background);
		Assert.areEqual("Hi mom!", s1.text);
	}
	
	@Test
	public function deserializeThrowsAnExceptionIfBackgroundIsMissing() : Void
	{
		try {
			var project:Project = new PersisterV1().deserializeProject(
				"<project fileVersion=\"1\" name=\"Rayyan the Rabbit\" scenesFile=\"hi.swf\" >" +
				"	<scene name=\"Scene 1\" background=\"\" text=\"Hi mom!\" />" +
				"</project>");
			Assert.fail("Exception excepted; didn't appear.");
		} catch (error:Dynamic) {
			Assert.isTrue(true);
		}
	}
	
	@Test
	public function deserializeThrowsAnExceptionIfTextIsMissing() : Void
	{
		try {
			var project:Project = new PersisterV1().deserializeProject(
				"<project fileVersion=\"1\" name=\"Rayyan the Rabbit\" scenesFile=\"hi.swf\">" +
				"	<scene name=\"Scene 1\" background=\"hi\" text=\"\" />" +
				"</project>");
			Assert.fail("Exception excepted; didn't appear.");
		} catch (error:Dynamic) {
			Assert.isTrue(true);
		}
	}
	
	@Test
	public function deserializeThrowsAnExceptionIfProjectScenesFileIsMissing() : Void
	{
		try {
			var project:Project = new PersisterV1().deserializeProject(
				"<project fileVersion=\"1\" name=\"Rayyan the Rabbit\">" +
				"	<scene name=\"Scene 1\" background=\"hi\" text=\"\" />" +
				"</project>");
			Assert.fail("Exception excepted; didn't appear.");
		} catch (error:Dynamic) {
			Assert.isTrue(true);
		}
	}
}