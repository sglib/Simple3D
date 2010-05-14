package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.StageQuality;
	import flash.events.Event;
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
		
		[Embed(source="DINO_2.GIF")]
		private var DINO	: Class;
		
		public function Simple3DTest() 
		{
			s3d = new Simple3D();
			bm = (new DINO() as Bitmap).bitmapData;
			
			addChild(s3d);			
			s3d.x = stage.stageWidth / 2;
			s3d.y = stage.stageHeight / 2;
			
			setup3d();
			
			stage.addEventListener(Event.ENTER_FRAME, _enterframe);
			stage.quality = StageQuality.LOW;
			
			//s3d.scaleX = s3d.scaleY = 0.5;
		}
		
		public function setup3d():void
		{
			
		}
		
		protected function _enterframe(e:Event):void 
		{
			
		}
		
	}

}