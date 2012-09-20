package com.deengames.gamebook.screen;
import com.blastcube.core.exception.Exception;
import com.blastcube.core.Screen;
import com.blastcube.vectorgraphics.Resize;
import com.deengames.gamebook.model.Project;
import com.deengames.gamebook.model.Scene;
import com.deengames.gamebook.persistance.PersistanceMediator;
import format.SWF;
import format.swf.MovieClip;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.Lib;
import nme.text.TextField;

using com.blastcube.extensions.TextFieldExtensions;

/**
 * ...
 * @author 
 */

class ShowScenesScreen extends Screen
{
	private var textFieldBorder:Int = 8;
	private var textFieldToolHeaderHeight:Int = 32;
	
	private var project:Project;
	private var currentScene:Scene;
	private var currentSceneIndex:Int;
	private var background:Sprite;
	private var textField:TextField;
	private var window:Sprite;
	
	public function new(fileName:String) 
	{	
		super();
		
		this.currentSceneIndex = 0;
		
		// Any validation failures will throw an exception here
		this.project = new PersistanceMediator().loadProject(fileName);
		this.currentScene = project.getScene(this.currentSceneIndex);
		
		// Show first screen
		this.background = this.addRasterizedVector(currentScene.background, "scene", Resize.AtMost, this.stageWidth, this.stageHeight);
		
		this.window = this.addRasterizedVector("assets/swf/window.swf", "window", Resize.AtMost, this.stageWidth, this.stageHeight);
		window.y = this.stageHeight - window.height;
		
		this.addTextWindow(currentScene.text);
	}
	
	private function addTextWindow(text:String)
	{
		this.textField = this.addTextField(text);
		this.textField.setFontSize(24);
		this.textField.setFontColour(0xFFFFFF);
		
		this.textField.multiline = true;
		this.textField.wordWrap = true;
		
		this.textField.width = this.stageWidth - (2 * textFieldBorder);
		this.textField.height = this.window.height - (2 * textFieldBorder);
		
		this.textField.x = textFieldBorder;
		this.textField.y = this.stageHeight - this.window.height + (this.window.scaleY * textFieldToolHeaderHeight) + textFieldBorder;
		
	}
}