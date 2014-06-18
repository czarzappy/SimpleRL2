package simple.shell.events
{
	import flash.events.Event;
	
	public class ScrollEvent extends Event
	{
		public static const START_SCROLL:String = "startScroll";
		
		public function ScrollEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ScrollEvent(type, bubbles, cancelable);
		}
	}
}

