package simple.shell.view.mediators
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	import simple.shell.events.ChooseFileEvent;
	
	public class ButtonContainerMediator extends Mediator
	{
		override public function initialize():void
		{
			addViewListener(ChooseFileEvent.CHOOSE_FILE, dispatch, ChooseFileEvent);
		}
	}
}