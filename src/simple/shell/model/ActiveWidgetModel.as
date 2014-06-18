package simple.shell.model
{
	import flash.system.ApplicationDomain;
	
	import mx.events.ModuleEvent;
	import mx.modules.IModuleInfo;
	import mx.modules.ModuleManager;
	
	import simple.common.utils.BaseActor;
	import simple.common.interfaces.IWidgetModule;
	import simple.common.utils.NamedObjectMap;
	import simple.shell.events.ActiveWidgetModelEvent;
	
	public class ActiveWidgetModel extends BaseActor
	{
		//Really just a url to "src/AcmeWidgetFactory.mxml"
		private static const MODULE_URL:String = 'modules/widget/WidgetModule.swf';
		
		protected var widgetMap:NamedObjectMap;
		protected var infoMap:NamedObjectMap;
		protected var loadedModuleInfo:IModuleInfo;
		
		public function ActiveWidgetModel()
		{
			widgetMap = new NamedObjectMap();
			infoMap = new NamedObjectMap();
		}
		
		public function createWidget(id:String):void
		{
			trace("Inside ActiveWidgetModel - createWidget")
			trace("	widgetMap.hasKey(id) : " + widgetMap.hasKey(id))
			if (widgetMap.hasKey(id) == false)
			{
				loadModule(id);
			}
		}
		
		public function getWidget(id:String):*
		{
			return widgetMap.getObject(id);
		}
		
		public function getWidgetId(widget:IWidgetModule):String
		{
			return widgetMap.getKey(widget);
		}
		
		public function hasWidgetId(id:String):Boolean
		{
			return widgetMap.hasKey(id);
		}
		
		public function removeById(id:String):void
		{
			widgetMap.removeByKey(id);
		}
		
		protected function createModule(id:String):void
		{
			var widget:IWidgetModule = loadedModuleInfo.factory.create() as IWidgetModule;
			widgetMap.registerObject(widget, id);
			eventDispatcher.dispatchEvent(new ActiveWidgetModelEvent(ActiveWidgetModelEvent.WIDGET_CREATED, id));
		}
		
		protected function loadModule(id:String):void
		{
			trace("Inside ActiveWidgetModel - loadModule")
			trace("	loadedModuleInfo : " + loadedModuleInfo)
			if (loadedModuleInfo == null)
			{
				var info:IModuleInfo = ModuleManager.getModule(MODULE_URL);
				info.data = id;
				info.addEventListener(ModuleEvent.PROGRESS, onModuleProgress);
				info.addEventListener(ModuleEvent.READY, onModuleReady);
				info.addEventListener(ModuleEvent.ERROR, onModuleError);
				info.load(ApplicationDomain.currentDomain);
				infoMap.registerObject(info, id);
				widgetMap.registerObject(info, id);
				trace("	info : " + info)
			}
			else
			{
				createModule(id);
			}
		}
		
		protected function onModuleReady(e:ModuleEvent):void
		{
			var widgetId:String = infoMap.getKey(e.module);
			loadedModuleInfo = e.module;
			eventDispatcher.dispatchEvent(new ActiveWidgetModelEvent(ActiveWidgetModelEvent.WIDGET_MODULE_READY, widgetId));
			infoMap.removeByObject(e.module);
			createModule(widgetId);
		}
		
		protected function onModuleError(e:ModuleEvent):void
		{
			var widgetId:String = infoMap.getKey(e.module);
			eventDispatcher.dispatchEvent(new ActiveWidgetModelEvent(ActiveWidgetModelEvent.WIDGET_MODULE_ERROR, widgetId, e));
		}
		
		protected function onModuleProgress(e:ModuleEvent):void
		{
			var widgetId:String = infoMap.getKey(e.module);
			eventDispatcher.dispatchEvent(new ActiveWidgetModelEvent(ActiveWidgetModelEvent.WIDGET_MODULE_PROGRESS, widgetId, e));
		}
	
	}
}