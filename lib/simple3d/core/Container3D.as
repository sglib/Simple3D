package simple3d.core 
{
	import flash.utils.Dictionary;
	import simple3d.core.Polygon;
	import simple3d.utils.MathUtils;
	import simple3d.utils.VectorUtils;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 * 
	 * An Object3D container, just as Sprite to hold DisplayObjects
	 */
	public class Container3D extends Object3D
	{
		public var _children 	: Array;
		
		public function Container3D() 
		{
			_children = [];
			super(new Vector.<Vertex>(), new Vector.<Polygon>());
		}
		
		public function add(obj: Object3D):void {
			if (!_children.indexOf(obj) != -1) {//not yet exist
				if (obj.parent) obj.parent.remove(obj);
				obj.parent = this;
				_children.push(obj);
				_onChildrenChanged();
			}
		}
		
		protected function _onChildrenChanged():void
		{
			_isdVerties = true;
			_isdFaces = true;
			if (this.parent) this.parent._onChildrenChanged();
		}
		
		public function remove(obj: Object3D):void {
			var id : int = _children.indexOf(obj);
			if (id != -1) {
				_children.splice(id, 1);
				obj.parent = null;
				_onChildrenChanged();
			}
		}
		
		override public function updateTransform():void 
		{
			super.updateTransform();
			
			var l : int = _children.length;
			for (var i: int = 0; i < l; i++) {//update children's transform also
				(_children[i] as Object3D).updateTransform();
			}
			
			//MathUtils.transVertices(transG, _vertices)
		}
		
		override public function get faces():Vector.<Polygon> { 
			if (_isdFaces) {
				_faces = VectorUtils.sortObjectsFaces(_children);
				_isdFaces = false;
			}
			return _faces;
		}
		
		protected function updateVertices(): void {
			var l : int = _children.length;
			var o : Object3D;
			
			//_isdVerties = false;
			
			for (var i: int = 0; i < l; i++) {
				o = _children[i];
				VectorUtils.appendVertices(_vertices, o.vertices);
			}
		}
		
		override public function get vertices():Vector.<Vertex> {
			_vertices = new Vector.<Vertex>();
			
			if (_isdVerties) updateVertices();
			return _vertices;
		}
		
		override public function toString():String { return '[Container3D x : '+ x + ' y : '+ y + ' z : '+ z + ']' ; }
		
	}

}