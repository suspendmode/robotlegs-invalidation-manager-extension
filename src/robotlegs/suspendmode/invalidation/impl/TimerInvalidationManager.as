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
package robotlegs.suspendmode.invalidation.impl
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 *
	 * @author suspendmode@gmail.com
	 *
	 */
	public class TimerInvalidationManager extends InvalidationManager
	{
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private static const invalidationTimer:Timer=new Timer(1);

		override protected function startValidation():void
		{
			invalidationTimer.addEventListener(TimerEvent.TIMER, onTimer);

			if (!invalidationTimer.running)
			{
				invalidationTimer.start();
			}
		}

		private function onTimer(event:TimerEvent):void
		{
			validate();
		}

		override protected function stopValidation():void
		{
			invalidationTimer.removeEventListener(TimerEvent.TIMER, onTimer);
			if (invalidationTimer.running && !invalidationTimer.hasEventListener(TimerEvent.TIMER))
			{
				invalidationTimer.stop();
			}
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	}
}
