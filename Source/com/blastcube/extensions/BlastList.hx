package com.blastcube.extensions;
import com.blastcube.core.exception.Exception;

/**
 * ...
 * @author ashes999
 */

class BlastList<T> extends List<T>
{

	public function new() 
	{
		super();
	}
	
	public function get(n:Int) : T
	{
		if (n < 0 || n >= this.length) {
			throw new Exception("N must be in the range [0 .. " + this.length + "] inclusively");
		} else {
			var iter:Iterator<T> = this.iterator();
			var i:Int = 0;
			
			while (i < n) {
				iter.next();
				i++;
			}
			
			return iter.next();
		}
	}
	
}