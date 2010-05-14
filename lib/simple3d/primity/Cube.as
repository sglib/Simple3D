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
	public class Cube extends Object3D
	{
		public function Cube(ptexture: BitmapData, pw: int = 0, ph: int = 0, pd: int = 0) 
		{
			if (pw == 0) pw = ptexture.width;
			if (ph == 0) ph = ptexture.height;
			if (pd == 0) pd = 100;
			
			var hw	: int = pw / 2;
			var hh	: int = ph / 2;
			var hd	: int = pd / 2;
			
			var vv : Vector.<Vertex> = Vector.<Vertex>([
						new Vertex( -hw, -hh, hd), new Vertex(hw, -hh, hd), new Vertex(hw, hh, hd), new Vertex( -hw, hh, hd),
						new Vertex( -hw, -hh, -hd), new Vertex(hw, -hh, -hd), new Vertex(hw, hh, -hd), new Vertex( -hw, hh, -hd)
					])
			
			
			super(	vv,
					Vector.<Polygon>([
						new Polygon(ptexture, Vector.<Vertex>([vv[0], vv[1], vv[2], vv[3]]))//front
						,new Polygon(ptexture, Vector.<Vertex>([vv[4], vv[0], vv[3], vv[7]]))//left
						,new Polygon(ptexture, Vector.<Vertex>([vv[1], vv[5], vv[6], vv[2]]))//right
						,new Polygon(ptexture, Vector.<Vertex>([vv[0], vv[4], vv[5], vv[1]]))//top
						,new Polygon(ptexture, Vector.<Vertex>([vv[7], vv[3], vv[2], vv[6]]))//bottom
						,new Polygon(ptexture, Vector.<Vertex>([vv[5], vv[4], vv[7], vv[6]]))//back						
					])
				);
		}
		
		override public function toString():String { return '[Cube x : '+ x + ' y : '+ y + ' z : '+ z + ']' ; }
		
	}

}