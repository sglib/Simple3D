package  
{
	import flash.events.Event;
	import simple3d.primity.Plane;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 */
	public class PlaneTest extends Simple3DTest
	{
		public var p : Plane;
		
		public function PlaneTest() 
		{
			
		}
		
		override public function setup3d():void 
		{
			p = new Plane(bm);
			s3d.add(p);
		}
		
		override protected function _enterframe(e:Event):void 
		{
			p.rotation.x += 0.05;
			p.rotation.y += 0.01;
			
			p.x = stage.mouseX - stage.stageWidth / 2;
			p.y = -stage.mouseY + stage.stageHeight / 2;			
		}
		
	}

}