package  
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
			b3d = new Book3D(bm, 400, 200);
			var kappa : Kappa = new Kappa(bm);
			
			s3d.world.y = -50;
			
			b3d.add(kappa);
			s3d.add(b3d);
			
			b3d.angle = Math.PI;
			
			
			
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
			//b3d.angle = stage.mouseY / stage.stageHeight * Math.PI;
			//b3d.angle = Math.min(Math.PI, Math.max(0, b3d.angle));
			super._enterframe(e);
		}
		
	}

}