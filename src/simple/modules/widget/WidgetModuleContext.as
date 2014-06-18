package simple.modules.widget
{
	import flash.display.DisplayObjectContainer;
	
	import mx.rpc.events.AbstractEvent;
	
	import robotlegs.bender.extensions.commandCenter.impl.CommandMapper;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.impl.Context;
	
	import simple.common.utils.ContextEvent;
	import simple.modules.widget.controller.WidgetShutdownCommand;
	import simple.modules.widget.view.WidgetCanvas;
	import simple.modules.widget.view.WidgetCanvasMediator;
	
	//import org.robotlegs.base.ContextEvent;
	//import org.robotlegs.demos.acmewidgetfactory.modules.widget.controller.WidgetShutdownCommand;
	//import org.robotlegs.demos.acmewidgetfactory.modules.widget.view.WidgetCanvas;
	//import org.robotlegs.demos.acmewidgetfactory.modules.widget.view.WidgetCanvasMediator;
	//import org.robotlegs.mvcs.Context;
	
	public class WidgetModuleContext extends Context
	{
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var commandMap:IEventCommandMap;
		
		public function WidgetModuleContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			// Controller
			commandMap.map(ContextEvent.SHUTDOWN, ContextEvent).toCommand(WidgetShutdownCommand);
			
			// View
			mediatorMap.map(WidgetCanvas).toMediator(WidgetCanvasMediator);
			
			// Ready
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
		}
	
	}
}