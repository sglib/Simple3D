package test.primity
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import simple3d.core.Object3D;
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
		
		[Embed(source = "../../../assets/bookBg.jpg")]
		protected var bitmapCls	: Class;
		override public function setup3d():Object3D 
		{
			//p = new Plane(null, 300, 300);
			p = new Plane((new bitmapCls() as Bitmap).bitmapData, 0, 0, (new bitmapCls() as Bitmap).bitmapData);
			p.z = 200;
			
			return p;
		}
		
		override protected function _enterframe(e:Event):void 
		{
			//p.rotation.x += 0.05;
			//p.rotation.y += 0.05;
			//p.rotation.z += 0.05;
			
			super._enterframe(e);
		}
		
	}

}