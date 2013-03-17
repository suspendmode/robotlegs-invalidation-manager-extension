package robotlegs.suspendmode.invalidation.api
{
	public interface IInvalidable
	{		
		
        function invalidate(type:uint=uint.MAX_VALUE, ...types: Array): void;
        		
	}
}