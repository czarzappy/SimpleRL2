package simple.common.interfaces
{

	public interface IWidgetModule extends IContextProvider
	{
		function setTitle(title:String):void;
		function poke():void;
		function close():void;
	}
}