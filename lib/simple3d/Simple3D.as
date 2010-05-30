package simple3d 
{
	import flash.display.BitmapData;
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
		
		private var root3d	: Container3D;
		public var world	: Container3D;
		public var faces	: Vector.<Polygon>;
		
		public var showGrid		: Boolean = false;
		public var showTexture	: Boolean = true;
		
		public function Simple3D() 
		{
			addEventListener(Event.ENTER_FRAME, _render);
			root3d = new Container3D();
			world = new Container3D();
			root3d.add(world);
		}
		
		private function _render(e:Event):void 
		{
			graphics.clear();
			
			//trace('rendering :: ', vertices.length);
			
			var vertices	: Vector.<Vertex> = root3d.vertices;
			var v			: Vertex;
			var face		: Polygon;
			var f			: Number;
			
			root3d.updateTransform();//apply transform on vertices
			
			var tmpZ : int = focus - camZ;
			
			//do project
			for (var i: int = 0; i < vertices.length; i++) {
				v = vertices[i];
				
				f = focus / (tmpZ + v.tz);
				
				v.gx = f * v.tx * zoom;
				v.gy = f * v.ty * zoom;
			}
			
			faces = root3d.faces;
			
			var l : int = faces.length;
			
			for (i = 0; i < l ; i++) {
				face = faces[i];
				face.updateRenderData();
				if (showGrid) graphics.lineStyle(0.1, 0xff0000);
				
				if (face.texture == null) {
					//trace('null texture detected :: ', i);
					face.texture = new BitmapData(10, 10, false, Math.random()*0xffffff);
				}
				
				if (showTexture) graphics.beginBitmapFill(face.texture);
				graphics.drawTriangles(face.renderData, face.indices, face.uv, TriangleCulling.POSITIVE);
			}
		}
		
		public function add(po: Object3D ): void {
			world.add(po);
		}
		
	}

}