package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.StageQuality;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import simple3d.Simple3D;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 */
	public class Simple3DTest extends MovieClip
	{
		public var s3d	: Simple3D;
		public var bm	: BitmapData;
		
		//[Embed(source="DINO_2.GIF")]
		//private var DINO	: Class;
		
		public function Simple3DTest() 
		{
			s3d = new Simple3D();
			bm = new BitmapData(640, 480, false, 0xff5555ff);
			//(new DINO() as Bitmap).bitmapData;
			
			addChild(s3d);			
			s3d.x = stage.stageWidth / 2;
			s3d.y = stage.stageHeight / 2 + 200;
			
			setup3d();
			
			stage.addEventListener(Event.ENTER_FRAME, _enterframe);
			stage.quality = StageQuality.LOW;
			
			Drag.register(stage).setCallback(onDrag);
			
			ty = s3d.world.rotation.y = 0;
		}
		
		protected var ty : Number;
		private function onDrag():void
		{
			var d : Drag = Drag.getDrag(stage);
			if (d.update == 0) {
				d.data = { mx : stage.mouseX, my : stage.mouseY, rx : s3d.world.rotation.x, ry: ty };
			}
			trace(ty);
			ty = (stage.mouseX - d.data.mx) * Math.PI / stage.stageWidth + d.data.ry;
			//s3d.world.rotation.x = (stage.mouseY - d.data.my) * Math.PI / stage.stageHeight + d.data.rx;	
		}
		
		public function setup3d():void
		{
			
		}
		
		protected function _enterframe(e:Event):void 
		{
			s3d.world.rotation.y += (ty -s3d.world.rotation.y) / 5;
		}
		
	}

}