package simple3d.primity 
{
	import flash.display.BitmapData;
	import simple3d.core.Object3D;
	import simple3d.core.Polygon;
	import simple3d.core.Vertex;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 */
	public class Plane extends Object3D
	{
		public function Plane(ptexture: BitmapData, pw: int = 0, ph: int = 0) 
		{
			if (pw == 0) pw = ptexture.width;
			if (ph == 0) ph = ptexture.height;
			
			var hw	: int = pw / 2;
			var hh	: int = ph / 2;
			
			var vv: Vector.<Vertex> = Vector.<Vertex>([new Vertex( -hw, -hh), new Vertex(hw, -hh), new Vertex(hw, hh), new Vertex( -hw, hh)]);
			var vp : Vector.<Polygon> = Vector.<Polygon>([new Polygon(ptexture, vv), new Polygon(ptexture, Vector.<Vertex>([vv[1], vv[0], vv[3], vv[2]]))]);
			
			super(vv, vp);
		}
		
		override public function toString():String { return '[Plane x : '+ x + ' y : '+ y + ' z : '+ z + ']' ; }
		
	}

}