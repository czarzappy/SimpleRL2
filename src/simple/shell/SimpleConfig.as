package simple.shell
{
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	//import simple.shell.control.commands.ChooseFileCommand;
	import simple.shell.control.commands.CreateWidgetCommand;
	import simple.shell.control.commands.OnScrollCommand;
	import simple.shell.control.commands.PokeWidgetCommand;
	import simple.shell.control.commands.RemoveWidgetCommand;
	import simple.shell.control.commands.SetSelectedFileCommand;
	import simple.shell.control.commands.UnregisterWidgetCommand;
	
	//import simple.shell.events.ActiveWidgetModelEvent;
	import simple.shell.events.FileResultEvent;
	import simple.shell.events.ScrollEvent;
	import simple.shell.events.ShellWidgetEvent;
	import simple.shell.events.ChooseFileEvent;
	//import simple.shell.events.FileChangeEvent;
	
	import simple.shell.model.ActiveWidgetModel;
	import simple.shell.model.SimpleModel;
	
	import simple.shell.service.FileService;
	import simple.shell.service.IFileService;
	
	import simple.shell.view.content.ButtonContainer;
	import simple.shell.view.mediators.ButtonContainerMediator;
	import simple.shell.view.content.ScrollbarContainer;
	import simple.shell.view.mediators.ScrollbarContainerMediator;
	import simple.shell.view.content.TextContainer;
	import simple.shell.view.mediators.TextContainerMediator;
	import simple.shell.view.mediators.WidgetHolderMediator;
	import simple.shell.view.content.WidgetHolderView;
	
	
	//public class SimpleConfig
	public class SimpleConfig implements IConfig
	{
		/*[Inject]
		public var injector:Injector*/
		
		[Inject]
		public var injector:IInjector;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var commandMap:IEventCommandMap;
		
		/*[PostConstruct]
		public function startup():void
		{
			commandMap.map(SimpleAppEvent.CHOOSE_FILE, SimpleAppEvent).toCommand(ChooseFileCommand);
			commandMap.map(FileResultEvent.FILE_RESULT, FileResultEvent).toCommand(SetSelectedFileCommand);
			
			injector.map(IFileService).toSingleton(FileService);
			
			injector.map(SimpleModel).asSingleton();
			
			mediatorMap.mapView(ButtonContainer).toMediator(ButtonContainerMediator);
			mediatorMap.mapView(TextContainer).toMediator(TextContainerMediator);
		}*/
		
		public function configure():void
		{
			//Command Mapping
			commandMap.map(ShellWidgetEvent.CREATE_WIDGET, ShellWidgetEvent).toCommand(CreateWidgetCommand);
			commandMap.map(ShellWidgetEvent.POKE_WIDGET, ShellWidgetEvent).toCommand(PokeWidgetCommand);
			commandMap.map(ShellWidgetEvent.REMOVE_WIDGET, ShellWidgetEvent).toCommand(RemoveWidgetCommand);
			commandMap.map(ShellWidgetEvent.REMOVE_WIDGET_COMPLETE, ShellWidgetEvent).toCommand(UnregisterWidgetCommand);
			commandMap.map(ChooseFileEvent.CHOOSE_FILE, ChooseFileEvent).toCommand(CreateWidgetCommand);
			commandMap.map(FileResultEvent.FILE_RESULT, FileResultEvent).toCommand(SetSelectedFileCommand);
			commandMap.map(ScrollEvent.START_SCROLL, ScrollEvent).toCommand(OnScrollCommand);
			
			injector.map(IFileService).toSingleton(FileService);
			
			injector.map(SimpleModel).asSingleton();
			injector.map(ActiveWidgetModel).asSingleton();
			
			//Mediator mapping
			mediatorMap.map(ButtonContainer).toMediator(ButtonContainerMediator);
			mediatorMap.map(TextContainer).toMediator(TextContainerMediator);
			mediatorMap.map(ScrollbarContainer).toMediator(ScrollbarContainerMediator);
			mediatorMap.map(WidgetHolderView).toMediator(WidgetHolderMediator);
		}
	}
}