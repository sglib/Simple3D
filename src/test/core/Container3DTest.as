package test.core
{
	import aze.motion.eaze;
	import flash.events.Event;
	import simple3d.core.Container3D;
	import simple3d.primity.Cube;
	import simple3d.primity.Plane;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 */
	public class Container3DTest extends Simple3DTest
	{
		public var c : Container3D;
		public var p : Plane;
		public var p2: Plane;
		public var cube : Cube;
		
		public function Container3DTest() 
		{
			
		}
		
		override public function setup3d():void 
		{
			c = new Container3D();
			p = new Plane(null, 400, 400);
			p2 = new Plane(null, 400, 400);
			cube = new Cube(null, 200, 200, 200);
			cube.z = -105;
			p2.z = - 210;
			
			c.add(cube);
			c.add(p);
			c.add(p2);
			
			s3d.add(c);
			
			c.z = 300;
		}
		
		override protected function _enterframe(e:Event):void 
		{
			p2.rotation.z += 0.05;
			p.rotation.z -= 0.05;
			cube.rotation.z += 0.1;
			
			super._enterframe(e);
		}
		
	}

}