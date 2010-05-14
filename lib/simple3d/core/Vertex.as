package simple3d.core 
{	
	public class Vertex extends V3D
	{
		public var time	: int;
		
		//original
		public var ox	: int;
		public var oy	: int;
		public var oz	: int;
		
		//x,y,z should be current morphed mesh
		
		//local transformed
		public var tx	: int;
		public var ty	: int;
		public var tz	: int;
		
		//global transformed
		public var gx	: int;
		public var gy	: int;
		//public var gz	: int;
		
		public function Vertex(px : int = 0, py : int = 0, pz : int = 0) 
		{
			super(px, py, pz);
			ox = px; oy = py; oz = pz;
		}
		
		//public static function originize(vv: Vector.<Vertex>, kx: Number = 1, ky: Number = 1, kz: Number = 1):void {
			//var v : Vertex;
			//
			//for (var i: int = 0; i < vv.length; i++) {
				//v = vv[i];
				//v.x = kx * v.ox;
				//v.y = ky * v.oy;
				//v.z = kz * v.oz;
			//}
		//}
		
		override public function toString():String { return '[Vertex x : '+ x + ' y : '+ y + ' z : '+ z + ']' ; }
		
	}

}