package simple.shell.control.commands
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import simple.shell.events.ScrollEvent;
	
	public class OnScrollCommand extends Command
	{
		[Inject]
		public var event:ScrollEvent;
		
		
		override public function execute():void
		{
			trace("Executing the OnScrollCommand");
		}
	}
}

