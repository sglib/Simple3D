package test.core
{
	import aze.motion.eaze;
	import flash.display.BitmapData;
	import flash.events.Event;
	import simple3d.core.Container3D;
	import simple3d.core.Object3D;
	import simple3d.primity.Cube;
	import simple3d.primity.Plane;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 */
	public class Container3DTest extends Simple3DTest
	{
		public function Container3DTest() 
		{
			
		}
		
		protected var c : Container3D;
		protected var p : Plane;
		
		override public function setup3d():Object3D 
		{
			c = new Container3D();
			
			p = new Plane(null, 400, 400);//, new BitmapData(100,100, false, 0x00ff00)
			p.rotation.x = -Math.PI / 2;
			c.add(p);
			
			tr = 3; //approximate Math.PI
			tz = 200;
			
			return c;
		}
		
	}

}