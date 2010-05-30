package test.core
{
	import flash.display.BitmapData;
	import flash.events.Event;
	import simple3d.core.Model3D;
	import simple3d.core.Object3D;
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
		
		override public function setup3d():Object3D 
		{
			m3d = new Model3D();
			
			m3d.useWelder = true;
			
			var p : Plane = new Plane(null, 200, 200, new BitmapData(100, 100, false, Math.random() * 0xffffff));
			p.x = 100;
			//p.y = -50;
			m3d.add(p);
			
			p = new Plane(null, 200, 200, new BitmapData(100, 100, false, Math.random() * 0xffffff));
			p.x = -100;
			//p.y = 50;
			m3d.add(p);
			
			p = new Plane(null, 200, 200, new BitmapData(100, 100, false, Math.random() * 0xffffff));
			p.z = -100;
			//p.y = 0;
			p.rotation.y = Math.PI / 2;
			m3d.add(p);
			
			p = new Plane(null, 200, 200, new BitmapData(100, 100, false, Math.random() * 0xffffff));
			p.z = 100;
			//p.y = 100;
			p.rotation.y = Math.PI / 2;
			m3d.add(p);
			
			return m3d;
		}
		
	}

}