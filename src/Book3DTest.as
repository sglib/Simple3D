package  
{
	import flash.events.Event;
	import simple3d.app.Book3D;
	import simple3d.core.Container3D;
	import simple3d.core.Vertex;
	import simple3d.primity.Plane;
	import simple3d.utils.VectorUtils;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 */
	public class Book3DTest extends Model3DTest
	{
		
		public function Book3DTest() 
		{
			
		}
		
		protected var b3d : Book3D;
		
		override public function setup3d():void 
		{
			b3d = new Book3D(bm, 400, 200);
			var p : Plane = new Plane(bm, 200, 200);
			p.x = 100;
			p.y = 100;
			b3d.add(p);
			
			p = new Plane(bm, 200, 200);
			p.x = -100;
			p.y = 100;
			b3d.add(p);
			
			p = new Plane(bm, 200, 200);
			p.z = -100;
			p.y = 100;
			p.rotation.y = Math.PI / 2;
			b3d.add(p);
			
			p = new Plane(bm, 200, 200);
			p.z = 100;
			p.y = 100;
			p.rotation.y = Math.PI / 2;
			b3d.add(p);
			
			s3d.add(b3d);
			
			//s3d.alpha = 0.85;
		}
		
		override protected function _enterframe(e:Event):void 
		{
			b3d.rotation.y += 0.02;
			//b3d.leftAngle = stage.mouseX / stage.width * Math.PI / 4;
			//b3d.ratio = stage.mouseX / stage.stageWidth;
			
			b3d.angle = stage.mouseX/stage.stageWidth * Math.PI;
			s3d.world.rotation.x = stage.mouseY / stage.stageHeight * Math.PI/2-Math.PI/4;
		}
		
	}

}