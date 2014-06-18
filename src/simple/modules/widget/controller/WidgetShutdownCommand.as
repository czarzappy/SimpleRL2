package simple.modules.widget.controller
{
//	import org.robotlegs.base.ContextEvent;
//	import org.robotlegs.mvcs.Command;
	import robotlegs.bender.bundles.mvcs.Command;
	import simple.common.utils.ContextEvent;
	
	public class WidgetShutdownCommand extends Command
	{
		override public function execute():void
		{
			// perhaps we want to do something before shutting down
			
			//Not sure where this eventDispatcher is suppose to be coming from,
			//since the only things that seem to have evenDispatcher extend
			//BaseActor
			//eventDispatcher.dispatchEvent(new ContextEvent(ContextEvent.SHUTDOWN_COMPLETE));
		}
	}
}