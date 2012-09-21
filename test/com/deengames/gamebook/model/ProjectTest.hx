package com.deengames.gamebook.model;
import com.deengames.gamebook.model.Project;
import massive.munit.Assert;

/**
 * ...
 * @author ashes999
 */

class ProjectTest
{

	public function new() {	}
	
	@Test
	public function getSceneReturnsSceneByIndex() : Void {
		var p:Project = new Project("Iteration Test", "N/A");
		
		for (i in 0 ... 3) {
			p.addScene(new Scene("Scene " + i, "", ""));
		}
		
		for (i in 0 ... 3) {
			Assert.areEqual("Scene " + i, p.getScene(i).name);
		}
	}
	
}