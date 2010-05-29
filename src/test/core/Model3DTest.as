package test.core
{
	import flash.events.Event;
	import simple3d.core.Model3D;
	import simple3d.primity.Plane;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 */
	public class Model3DTest extends Simple3DTest
	{
		
		public function Model3DTest() 
		{
			
		}
		
		protected var m3d : Model3D;
		
		override public function setup3d():void 
		{
			m3d = new Model3D();
			var p : Plane = new Plane(null, 200, 200);
			p.x = 100;
			p.y = -50;
			m3d.add(p);
			
			p = new Plane(null, 200, 200);
			p.x = -100;
			p.y = 50;
			m3d.add(p);
			
			p = new Plane(null, 200, 200);
			p.z = -100;
			p.y = 0;
			p.rotation.y = Math.PI / 2;
			m3d.add(p);
			
			p = new Plane(null, 200, 200);
			p.z = 100;
			p.y = 100;
			p.rotation.y = Math.PI / 2;
			m3d.add(p);
			
			s3d.add(m3d);
		}
		
	}

}