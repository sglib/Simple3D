package test.app
{
	import aze.motion.eaze;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import model.Kappa;
	import simple3d.app.Book3D;
	import simple3d.core.Object3D;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 18 May 2010 (0.1.0)
	 */
	public class BookKappaTest extends Simple3DTest
	{
		
		public function BookKappaTest() 
		{
			
		}
		
		protected var b3d : Book3D;
		
		override public function setup3d():void 
		{
			b3d = new Book3D(null, 600, 300);
			var kappa : Kappa = new Kappa();
			b3d.add(kappa);
			
			b3d.y = -200;
			
			s3d.add(b3d);
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		protected var _open : Boolean;
		private function onClick(e:MouseEvent):void 
		{
			_open = !_open;
			eaze(b3d).to(1, { angle : _open ? Math.PI : 0 } );
		}
		
		override protected function _enterframe(e:Event):void 
		{
			super._enterframe(e);
		}
		
	}

}