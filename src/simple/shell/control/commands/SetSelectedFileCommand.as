package simple.shell.control.commands
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import simple.shell.events.FileResultEvent;
	import simple.shell.model.SimpleModel;
	
	public class SetSelectedFileCommand extends Command
	{
		[Inject]
		public var event:FileResultEvent;
		
		[Inject]
		public var simpleModel:SimpleModel;
		
		override public function execute():void
		{
			trace("Executing the FileReadCommand");
			simpleModel.fileName = event.fileName;
			simpleModel.filePath = event.filePath;
		}
	}
}