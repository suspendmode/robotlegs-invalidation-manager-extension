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
	import flash.utils.Dictionary;
	import robotlegs.suspendmode.invalidation.api.IInvalidable;
	import robotlegs.suspendmode.invalidation.api.IInvalidationManager;

	/**
	 *
	 * @author suspendmode@gmail.com
	 *
	 */
	public class InvalidationManager implements IInvalidationManager
	{

		private var flags:Dictionary=new Dictionary();

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		public function invalidate(target:IInvalidable, types:Array=null):void
		{
			if (isInvalidating(target))
			{
				return;
			}
			if (!types)
			{
				types=[uint.MAX_VALUE];
			}
			updateInvalidationFlag(target, types);
			startValidation();
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		public function isInvalidating(target:IInvalidable):Boolean
		{
			if (target in flags)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		

		public function isInvalid(target:IInvalidable, flag:uint=uint.MAX_VALUE):Boolean
		{
			var targetFlag: uint = flags[target];
			return Boolean(flag & targetFlag);			
		}


		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		public function validateNow(target:IInvalidable, types:Array=null):void
		{
			if (isInvalidating(target))
			{
				return;
			}
			updateInvalidationFlag(target, types);
			startValidation();
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		protected function startValidation():void
		{
			throw "not implemented";
		}

		protected function validate():void
		{
			stopValidation();

			if (qeuedValidation)
			{
				for (var next:* in flags)
				{
					if (next)
					{
						break;
					}
				}
				if (next)
				{
					validateTarget(next);
				}
			}
			else
			{
				for (var target:* in flags)
				{
					validateTarget(target);
				}

			}

		}

		protected function stopValidation():void
		{
			throw "not implemented";
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private function updateInvalidationFlag(target:IInvalidable, types:Array):void
		{
			var flag:uint;
			if (target in flags)
			{
				flag=flags[target];
			}
			else
			{
				flag=flags[target]=0;
			}
			for each (var type:uint in types)
			{
				flag|=type;
			}
			flags[target]=flag;
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private function validateTarget(target:IInvalidable):void
		{
			var flag:uint=flags[target];
			target.validate();
			delete flags[target];
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		

		private var _qeuedValidation:Boolean=false;

		public function get qeuedValidation():Boolean
		{
			return _qeuedValidation;
		}

		public function set qeuedValidation(value:Boolean):void
		{
			if (_qeuedValidation == value)
				return;
			_qeuedValidation=value;
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		

	}
}
