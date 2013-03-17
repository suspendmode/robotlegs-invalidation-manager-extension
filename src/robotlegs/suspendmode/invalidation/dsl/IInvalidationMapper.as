package robotlegs.suspendmode.invalidation.dsl
{
    public interface IInvalidationMapper
    {
        function invalidate(target: Object, validationMethodName: String = "validate"): void;
    }
}