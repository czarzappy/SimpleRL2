package simple.shell.events
{
	import flash.events.Event;
	
	public class ChooseFileEvent extends Event
	{
		public static const CHOOSE_FILE:String = "chooseFile";
		
		public function ChooseFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ChooseFileEvent(type, bubbles, cancelable);
		}
	}
}