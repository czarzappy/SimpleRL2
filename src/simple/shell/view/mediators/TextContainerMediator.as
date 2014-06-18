package simple.shell.view.mediators
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	import simple.shell.events.FileChangeEvent;
	import simple.shell.view.content.TextContainer;
	
	public class TextContainerMediator extends Mediator
	{
		[Inject]
		public var view:TextContainer;
		
		override public function initialize():void
		{
			addContextListener(FileChangeEvent.FILE_NAME_CHANGE, onFileNameChange, FileChangeEvent);
			addContextListener(FileChangeEvent.FILE_PATH_CHANGE, onFilePathChange, FileChangeEvent);
		}
		
		
		private function onFileNameChange(event:FileChangeEvent):void
		{
			view.setFileName(event.value);
		}
		
		
		private function onFilePathChange(event:FileChangeEvent):void
		{
			view.setFilePath(event.value);
		}
	}
}