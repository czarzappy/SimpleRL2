package simple.shell.control.commands
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import simple.shell.service.IFileService;
	
	public class ChooseFileCommand extends Command
	{
		[Inject]
		public var fileService:IFileService;
		
		
		override public function execute():void
		{
			trace("Executing the ChooseFileCommand");
			fileService.promptToChooseFile();
		}
	}
}