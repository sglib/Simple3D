package test.app
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import simple3d.app.Book3D;
	import simple3d.core.Container3D;
	import simple3d.core.Object3D;
	import simple3d.core.Vertex;
	import simple3d.primity.Cube;
	import simple3d.primity.Plane;
	import simple3d.utils.VectorUtils;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 */
	public class Book3DTest extends Simple3DTest
	{
		
		public function Book3DTest() 
		{
			
		}
		
		protected var b3d : Book3D;
		
		override public function setup3d():Object3D 
		{
			b3d = new Book3D(null, 400, 400);
			
			var bmd : BitmapData = new BitmapData(100, 100, false, Math.random() * 0xffffff);
			
			var p : Plane = new Plane(null, 200, 200, bmd);
			p.x = 100;
			p.y = 100;
			b3d.add(p);
			
			
			
			p = new Plane(null, 200, 200, bmd);
			p.x = -100;
			p.y = 100;
			b3d.add(p);
			
			p = new Plane(null, 200, 200, bmd);
			p.z = -100;
			p.y = 100;
			p.rotation.y = Math.PI / 2;
			b3d.add(p);
			
			p = new Plane(null, 200, 200, bmd);
			p.z = 100;
			p.y = 100;
			p.rotation.y = Math.PI / 2;
			b3d.add(p);
			
			var cube : Cube;
			
			for (var i: int = 0; i < 4; i++) {
				cube = new Cube(null, 100, 100);
				cube.y = 100;
				cube.x = (i % 2 == 0) ? 100 : -100;
				cube.z = (i < 2) ? 100: -100;
				b3d.add(cube);
			}
			
			cube = new Cube(null, 100, 100);
			cube.y = 800;
			b3d.add(cube);
			
			b3d.y = -200;
			
			return b3d;
		}
		
		override protected function _enterframe(e:Event):void 
		{
			b3d.angle = stage.mouseY / stage.stageHeight * Math.PI;
			b3d.angle = Math.min(Math.PI, Math.max(0, b3d.angle));
			super._enterframe(e);
		}
		
	}

}