package 
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * 
	 * @rule : Handle mouse drag action that give better control than flash's build in startDrag / stopDrag
	 * 
	 * @request Addding support for multiple Drag actions for the same target (with different key combination)
	 * 
	 * @update 21 Nov 2009 (0.1.0)
	 * 		+ Support register / unregister / get Drag instance from target
	 * 		+ Support key-combination CTRL | SHIFT | ALT
	 * 
	 */
	public class Drag
	{
		public static const NONE	: int = 0;
		public static const SHIFT	: int = 1;
		public static const CTRL 	: int = 2;
		public static const ALT		: int = 3;
		public static const ANY		: int = 4;
		
		protected static var dict	: Dictionary;
		
		protected var _key		: int;
		protected var _target	: DisplayObject;
		
		protected var _stageRef	: Stage;
		
		protected var _callback	: Function;
		protected var _params	: Array;
		
		protected var _update	: int;
		public var data			: Object; //user data
		
		public function Drag(target: DisplayObject) 
		{
			_target = target;
			_target.addEventListener(MouseEvent.MOUSE_DOWN, _startDrag);
		}
		
		private function _startDrag(e:MouseEvent):void 
		{
			var effective : Boolean = (_key == ANY) || (_key == NONE && (!e.altKey && !e.ctrlKey && !e.shiftKey)) || (e.altKey && _key == ALT) || (e.ctrlKey && _key == CTRL) || (e.shiftKey && _key == SHIFT);
			if (effective) {
				_stageRef = _target.stage;
				_stageRef.addEventListener(MouseEvent.MOUSE_UP, _endDrag);
				_stageRef.addEventListener(Event.MOUSE_LEAVE, _endDrag);
				_stageRef.addEventListener(Event.ENTER_FRAME, _updateDrag);
				_target.addEventListener(Event.REMOVED_FROM_STAGE, _endDrag);
				_update = 0;
				data = null;//remove all old data
				_updateDrag(null);
			}
		}
		
		private function _endDrag(e:Event):void 
		{
			_stageRef = _target.stage;
			_stageRef.removeEventListener(MouseEvent.MOUSE_UP, _endDrag);
			_stageRef.removeEventListener(Event.MOUSE_LEAVE, _endDrag);
			_target.removeEventListener(Event.REMOVED_FROM_STAGE, _endDrag);
			_stageRef.removeEventListener(Event.ENTER_FRAME, _updateDrag);
			_update = -1;
			_updateDrag(null);
		}
		
		private function _updateDrag(e:Event):void 
		{
			if (e) _update++;
			if (_callback != null) _callback.apply(_callback, _params);
		}
		
		public function setKey(key: int): Drag {
			_key = key;
			return this;
		}
		
		public function setCallback(f: Function, params: Array = null): Drag {
			_callback = f;
			_params = params;
			return this;
		}
		
		public static function register(target: DisplayObject): Drag {
			if (!dict) dict = new Dictionary();
			dict[target] = new Drag(target);
			
			return dict[target];
		}
		
		public static function unRegister(target: DisplayObject): void {
			delete dict[target];
		}
		
		public static function getDrag(target: DisplayObject): Drag {
			return dict[target];
		}
		
		public function get update(): int {
			return _update;
		}
		
	}

}