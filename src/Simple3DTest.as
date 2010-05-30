package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.StageQuality;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import simple3d.core.Container3D;
	import simple3d.core.Object3D;
	import simple3d.Simple3D;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 */
	public class Simple3DTest extends MovieClip
	{
		public var s3d			: Simple3D;
		protected var target 	: Object3D;
		
		public function Simple3DTest() 
		{
			s3d = new Simple3D();
			//s3d.showGrid = true;
			target = setup3d();
			s3d.add(target);
			
			s3d.x = stage.stageWidth / 2;
			s3d.y = stage.stageHeight / 2;
			stage.addEventListener(Event.ENTER_FRAME, _enterframe);
			stage.quality = StageQuality.LOW;
			
			addChild(s3d);
			
			Drag.register(stage).setCallback(onDrag);
		}
		
		protected var tz 	: Number = 0;
		protected var tr 	: Number = 0;
		protected var nStep	: Number = 20;
		
		protected var maxZ	: int = 1000;
		protected var minZ  : int = 0;
		
		protected var minAng: Number = 0
		protected var maxAng: Number = Math.PI/4;
		
		private function onDrag():void
		{
			var d : Drag = Drag.getDrag(stage);
			
			if (d.update == 0) {//update throw
				d.data = { mx : stage.mouseX, my : stage.mouseY, ry : tr, z: tz };
				nStep = 5;
			} else if (d.update == -1) {
				nStep = 5.1;
			}
			
			var dx : int = stage.mouseX - d.data.mx;
			var dy : int = stage.mouseY - d.data.my;
			
			tr = d.data.ry - dx / stage.stageWidth * Math.PI * 2;
			tz = Math.max(minZ, Math.min(maxZ, dy * 2 + d.data.z));
		}
		
		public function setup3d():Object3D
		{
			return null;
		}
		
		protected function _enterframe(e:Event):void 
		{
			if (nStep > 5 && nStep < 20) nStep += 0.5; //decrease speed while release mouse
			
			target.rotation.y += (tr - target.rotation.y) / nStep;
			s3d.world.z += (tz - s3d.world.z) / nStep;
			s3d.world.rotation.x = minAng + (maxAng - minAng) * (s3d.world.z - minZ) / (maxZ - minZ);
		}
		
	}

}