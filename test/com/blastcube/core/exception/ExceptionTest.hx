package com.blastcube.core.exception;

import com.blastcube.core.exception.Exception;
import massive.munit.Assert;

using com.blastcube.extensions.StringExtensions;

/**
 * ...
 * @author ashes999
 */

class ExceptionTest 
{

	public function new() { }
	
	@Test
	public function getMessageReturnsConstructorMessage() : Void {
		var e:Exception = new Exception("Division by zero");
		Assert.areEqual("Division by zero", e.getMessage());
	}
	
	@Test
	public function getSourceHasFileName() : Void {
		var e:Exception = new Exception("Division by zero");
		Assert.isTrue(e.getSource().contains("ExceptionTest.hx"));
	}
	
	@Test
	public function getSourceHasLineNumber() : Void {
		var e:Exception = new Exception("Division by zero");
		Assert.isTrue(e.getSource().contains("Line:"));
	}
	
	@Test
	public function getSourceHasMethod() : Void {
		var e:Exception = new Exception("Division by zero");
		Assert.isTrue(e.getSource().contains("getSourceHasMethod"));
	}
}