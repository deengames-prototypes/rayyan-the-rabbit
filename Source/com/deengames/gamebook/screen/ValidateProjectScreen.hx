package com.deengames.gamebook.screen;
import com.blastcube.core.Screen;
import com.blastcube.vectorgraphics.MovieclipUtils;
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

class ValidateProjectScreen extends Screen
{
	public function new(fileName:String) 
	{	
		super();
		
		// Any validation failures will throw an exception here
		var project:Project = new PersistanceMediator().loadProject(fileName);
		// Show first screen; pass entire project to the StoryScreen?
		
		//Lib.current.stage.addChild(new Bitmap(BitmapCache.get(Square)));		
		var square:Sprite = MovieclipUtils.getScaledBitmap("assets/test.swf", "Square", 2.5);
		//var square:MovieClip = swf.createMovieClip("Squarez");
		Lib.current.stage.addChild(square);
		
		//square.scaleX *= 2.5;
		//square.scaleY *= 2.5;
	}
}