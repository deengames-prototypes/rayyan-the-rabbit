package com.deengames.gamebook.screen;
import com.blastcube.core.exception.Exception;
import com.blastcube.core.Screen;
import com.blastcube.vectorgraphics.Resize;
import com.deengames.gamebook.model.Project;
import com.deengames.gamebook.persistance.PersistanceMediator;
import format.SWF;
import format.swf.MovieClip;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.Lib;

/**
 * ...
 * @author 
 */

class ShowScenesScreen extends Screen
{
	public function new(fileName:String) 
	{	
		super();
		
		// Any validation failures will throw an exception here
		var project:Project = new PersistanceMediator().loadProject(fileName);
		
		// Show first screen
		this.addRasterizedVector(project.getScene(0).background, "scene", Resize.AtMost, this.stageWidth, this.stageHeight);
	}
}