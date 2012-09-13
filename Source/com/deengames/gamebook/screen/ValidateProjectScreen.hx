package com.deengames.gamebook.screen;
import com.blastcube.core.Screen;
import com.blastcube.vectorgraphics.BitmapCache;
import com.deengames.gamebook.model.Project;
import com.deengames.gamebook.persistance.PersistanceMediator;
import com.deengames.gamebook.Square;
import format.SWF;
import format.swf.MovieClip;
import nme.Assets;
import nme.display.Bitmap;
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
		var swf = new SWF(Assets.getBytes("assets/square.swf"));
		var square:MovieClip = swf.createMovieClip("Squarez");
		Lib.current.stage.addChild(square);
		
		square.x = square.width;
		square.y = square.height;
		
		square.scaleX *= 5;
		square.scaleY *= 5;
	}
}