package simple3d 
{
	import flash.display.Sprite;
	import flash.display.TriangleCulling;
	import flash.events.Event;
	import flash.utils.getTimer;
	import simple3d.core.Container3D;
	import simple3d.core.Object3D;
	import simple3d.core.Polygon;
	import simple3d.core.Vertex;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 * 
	 * Simple3D Main class
	 */
	public class Simple3D extends Sprite
	{
		public var focus	: Number = 100;
		public var camZ		: Number = -900;
		public var zoom		: Number = 10;//default values make objects at it correct size when z=0
		
		public var world	: Container3D;
		public var faces	: Vector.<Polygon>;
		
		public function Simple3D() 
		{
			addEventListener(Event.ENTER_FRAME, _render);
			world = new Container3D();
		}
		
		private function _render(e:Event):void 
		{
			graphics.clear();
			
			var vertices	: Vector.<Vertex> = world.vertices;
			var v			: Vertex;
			var face		: Polygon;
			var f			: Number;
			
			world.updateTransform();//apply transform on vertices
			
			//do project
			for (var i: int = 0; i < vertices.length; i++) {
				v = vertices[i];
				f = focus / (focus + v.tz - camZ);
				v.gx = f * v.tx * zoom;
				v.gy = f * v.ty * zoom;
			}
			
			faces = world.faces;
			
			var l : int = faces.length;
			
			for (i = 0; i < l ; i++) {
				face = faces[i];
				face.updateRenderData();
				graphics.lineStyle(0.1, 0x888888);
				graphics.beginBitmapFill(face.texture);
				graphics.drawTriangles(face.renderData, face.indices, face.uv, TriangleCulling.POSITIVE);
			}
		}
		
		public function add(po: Object3D ): void {
			world.add(po);
		}
		
	}

}