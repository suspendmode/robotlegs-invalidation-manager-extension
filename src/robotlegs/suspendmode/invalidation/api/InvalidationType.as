/**
 *
 * Copyright 2012(C) by Piotr Kucharski. 
 * email: suspendmode@gmail.com 
 * mobile: +48 791 630 277
 *
 * All rights reserved. Any use, copying, modification, distribution and selling of this software and it's documentation
 * for any purposes without authors' written permission is hereby prohibited.
 *
 */
package robotlegs.suspendmode.invalidation.api
{
	
	/**
	 *
	 * @author suspendmode@gmail.com
	 *
	 */
	public class InvalidationType
	{
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		public static const SIZE:uint=0x0001;
		
		public static const DATA:uint=0x0002;
		
		public static const STYLE:uint=0x0004;
		
		public static const LAYOUT:uint=0x0008;
		
		public static const STATE:uint=0x0016;
		
		public static const ALL:uint=uint.MAX_VALUE;
		
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	}
}