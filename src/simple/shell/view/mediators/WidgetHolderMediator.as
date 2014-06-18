package simple.shell.view.mediators
{
	import flash.display.DisplayObject;
	
	//import org.robotlegs.demos.acmewidgetfactory.shell.controller.ShellWidgetEvent;
	import simple.shell.events.ShellWidgetEvent;
	
	//import org.robotlegs.demos.acmewidgetfactory.shell.model.ActiveWidgetModel;
	//import org.robotlegs.demos.acmewidgetfactory.shell.model.ActiveWidgetModelEvent;
	import simple.shell.model.ActiveWidgetModel;
	import simple.shell.events.ActiveWidgetModelEvent;
	
	//import org.robotlegs.mvcs.Mediator;
	import robotlegs.bender.bundles.mvcs.Mediator;
	import simple.shell.view.content.WidgetHolderView;
	
	
	public class WidgetHolderMediator extends Mediator
	{
		private static const MODULE_URL:String = 'org/robotlegs/demos/acmewidgetfactory/modules/generic/GenericModule.swf';
		
		[Inject]
		public var view:WidgetHolderView;
		
		[Inject]
		public var activeWidgetModel:ActiveWidgetModel;
		
		public function WidgetHolderMediator()
		{
		}
		
		//Changed from onRegister(). Assuming there are the same function
		override public function initialize():void
		{
			eventMap.mapListener(eventDispatcher, ActiveWidgetModelEvent.WIDGET_CREATED, onWidgetCreated);
			eventMap.mapListener(eventDispatcher, ShellWidgetEvent.SHUTDOWN_WIDGET_COMPLETE, onShutdownWidgetComplete);
		}
		
		protected function onWidgetCreated(e:ActiveWidgetModelEvent):void
		{
			view.addChild(activeWidgetModel.getWidget(e.widgetId));
		}
		
		protected function onShutdownWidgetComplete(e:ShellWidgetEvent):void
		{
			view.removeChild(activeWidgetModel.getWidget(e.widgetId) as DisplayObject);
			eventDispatcher.dispatchEvent(new ShellWidgetEvent(ShellWidgetEvent.REMOVE_WIDGET_COMPLETE, e.widgetId));
		}
		
	}
}