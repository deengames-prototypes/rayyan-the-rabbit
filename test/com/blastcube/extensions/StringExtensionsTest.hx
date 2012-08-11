package com.blastcube.extensions;

import massive.munit.Assert;
using com.blastcube.extensions.StringExtensions;

/**
 * ...
 * @author ashes999
 */

class StringExtensionsTest
{	
	public function new() { }
	
	@Test
	public function startsWithReturnsTrueIfTargetStartsWithValue() : Void {
		var target:String = "hi mom!";
		Assert.isTrue(target.startsWith("hi"));
		Assert.isFalse(target.startsWith("mom!"));
	}
	
	@Test
	public function endsWithReturnsTrueIfTargetEndsWithValue() : Void {
		var target:String = "hi mom!";
		Assert.isTrue(target.endsWith("mom!"));
		Assert.isFalse(target.endsWith("hi"));
	}
	
	@Test
	public function trimTrimsNewlinesFromStartOfTarget() : Void {
		var expected:String = "trim me!";
		var actual:String = "\n\n\ntrim me!".trim();
		Assert.areEqual(expected, actual);
	}
	
	@Test
	public function trimTrimsNewlinesFromEndOfTarget() : Void {
		var expected:String = "trim me!";
		var actual:String = "trim me!\n\n".trim();
		Assert.areEqual(expected, actual);
	}
}