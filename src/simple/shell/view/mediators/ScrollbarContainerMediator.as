package simple.shell.view.mediators
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	import simple.shell.events.ScrollEvent;
	
	public class ScrollbarContainerMediator extends Mediator
	{
		override public function initialize():void
		{
			addViewListener(ScrollEvent.START_SCROLL, dispatch, ScrollEvent);
		}
	}
}

