package com.blastcube.extensions;

import massive.munit.Assert;
import nme.text.TextField;
using com.blastcube.extensions.TextFieldExtensions;

/**
 * ...
 * @author ashes999
 */

class TextFieldExtensionsTest
{	
	public function new() { }
	
	@Test
	public function setFontSetsDefaultTextFormat() : Void {
		var textField:TextField = new TextField();
		
		// Pre-condition: it's not Arial yet.
		Assert.areNotEqual("Arial", textField.defaultTextFormat.font);
		
		textField.setFont("Arial");
		Assert.areEqual("Arial", textField.defaultTextFormat.font);
	}
}