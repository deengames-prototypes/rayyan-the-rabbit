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
			"<project fileVersion='1' name='Rayyan the Rabbit' scenesFile='scenes.swf'>" +
			"	<scene name='Scene 1' background='beach' narration='hi.mp3' backgroundAudio='seagulls.mp3' text='Hi mom!' />" +
			"	<scene name='Scene 2' background='scene2' narration='ho.mp3' text='...' />" +
			"</project>");
			
		Assert.areEqual("Rayyan the Rabbit", project.name);
		Assert.areEqual(2, project.sceneCount);
		
		var s1:Scene = project.getScene(0);
		Assert.areEqual("Scene 1", s1.name);
		Assert.areEqual("beach", s1.background);
		Assert.areEqual("hi.mp3", s1.narration);
		Assert.areEqual("Hi mom!", s1.text);
		Assert.areEqual("seagulls.mp3", s1.backgroundAudio);
	}
	
	
	@Test
	public function deserializeThrowsAnExceptionIfProjectScenesFileIsMissing() : Void
	{
		try {
			var project:Project = new PersisterV1().deserializeProject(
				"<project fileVersion='1' name='Rayyan the Rabbit'>" +
				"	<scene name='Scene 1' background='hi' narration='ho' text='hee' />" +
				"</project>");
			Assert.fail("Exception excepted; didn't appear.");
		} catch (error:Dynamic) {
			Assert.isTrue(true);
		}
	}
	
	@Test
	public function deserializeThrowsAnExceptionIfSceneBackgroundIsMissing() : Void
	{
		try {
			var project:Project = new PersisterV1().deserializeProject(
				"<project fileVersion='1' name='Rayyan the Rabbit' scenesFile='hi.swf' >" +
				"	<scene name='Scene 1' background='' narration='hi' text='Hi mom!' />" +
				"</project>");
			Assert.fail("Exception excepted; didn't appear.");
		} catch (error:Dynamic) {
			Assert.isTrue(true);
		}
	}
	
	@Test
	public function deserializeThrowsAnExceptionIfSceneTextIsMissing() : Void
	{
		try {
			var project:Project = new PersisterV1().deserializeProject(
				"<project fileVersion='1' name='Rayyan the Rabbit' scenesFile='hi.swf'>" +
				"	<scene name='Scene 1' background='hi' narration='narrate1' text='' />" +
				"</project>");
			Assert.fail("Exception excepted; didn't appear.");
		} catch (error:Dynamic) {
			Assert.isTrue(true);
		}
	}
	
	@Test
	public function deserializeThrowsAnExceptionIfSceneNarrationIsMissing() : Void
	{
		try {
			var project:Project = new PersisterV1().deserializeProject(
				"<project fileVersion='1' name='Rayyan the Rabbit' scenesFile='hi.swf'>" +
				"	<scene name='Scene 1' background='hi' narration='' text='ahem' />" +
				"</project>");
			Assert.fail("Exception excepted; didn't appear.");
		} catch (error:Dynamic) {
			Assert.isTrue(true);
		}
	}
}