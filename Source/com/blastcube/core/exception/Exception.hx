package com.blastcube.core.exception;
import haxe.PosInfos;
import haxe.Stack;
using com.blastcube.extensions.StringExtensions;

/**
 * ...
 * @author ashes999
 */

class Exception 
{
	private var message:String;
	private var calls:String;
	private var info:PosInfos;

	public function new (message : String, ?info : PosInfos) {
		this.message = message;
		this.calls = "Call stack available in debug mode only.";
		
		#if debug
		this.calls = Stack.toString(Stack.callStack());
		#end
		
		this.info = info;				
	}
	
	public function getMessage() : String {
		return this.message;
	}
	
	public function getSource() : String {
		if (info != null) {
			return "File: " + this.info.fileName + " | Line: " + this.info.lineNumber + "\n" +
				"In method " + this.info.methodName + " of class " + this.info.className;
		} else {
			return "No source info available";
		}
	}
	
	public function getStack() : String {
		var toReturn:String = "Exception stack available in debug mode only.";
		#if debug
		toReturn = Stack.toString(Stack.exceptionStack());
		#end
		return toReturn;
	}
	
	public function getCallStack() : String {
		return this.calls;
	}
	
	public function toString() : String {
		return this.getMessage() + "\n" + this.getSource() + "\n\n" + 
			StringTools.rpad("StackTrace\n", "=", 21) + "\n" + this.getStack() + "\n\n" + 
			StringTools.rpad("CallStackTrace\n", "=", 26) + "\n" + this.getCallStack();
	}
}