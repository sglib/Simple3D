package simple3d.core 
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 * 
	 * Vector3D
	 */
	public class V3D
	{
		public var x  	: Number;
		public var y	: Number;
		public var z	: Number;
		
		public function V3D(px : Number = 0, py : Number = 0, pz : Number = 0) 
		{
			x = px;
			y = py;
			z = pz;
		}
		
		public function same(pv : V3D):Boolean {
			return x == pv.x && y == pv.y && z == pv.z;
		}
		
		public function copy(pv: V3D): void {
			x = pv.x; y = pv.y; z = pv.z;
		}
		
		public function toString():String { return '[V3D x : '+ x + ' y : '+ y + ' z : '+ z + ']' ; }
		
	}

}