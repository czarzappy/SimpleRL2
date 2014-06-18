package simple.common.interfaces
{
	import robotlegs.bender.framework.api.IContext;

	public interface IContextProvider
	{
		function getContext():IContext;
	}
}