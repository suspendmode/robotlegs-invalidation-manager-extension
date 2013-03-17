/**
 *
 */
package robotlegs.suspendmode.invalidation.api
{

	/**
	 *
	 * @author Peter
	 *
	 */
	public interface IInvalidationManager
	{
		/**
		 *
		 * @param target
		 * @param types
		 *
		 */
		function invalidate(target:IInvalidable, types:Array=null):void;

		/**
		 *
		 * @param target
		 * @return
		 *
		 */
		function isInvalidating(target:IInvalidable):Boolean;

		/**
		 *
		 * @param target
		 * @param flag
		 * @return
		 *
		 */
		function isInvalid(target:IInvalidable, flag:uint=uint.MAX_VALUE):Boolean;

		/**
		 *
		 * @param target
		 * @param types
		 *
		 */
		function validateNow(target:IInvalidable, types:Array=null):void;
	}
}
