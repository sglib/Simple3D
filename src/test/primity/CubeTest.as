package test.primity
{
	import flash.events.Event;
	import simple3d.primity.Cube;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 */
	public class CubeTest extends Simple3DTest
	{
		public var cube : Cube;
		
		public function CubeTest() 
		{
			
		}
		
		override public function setup3d():void 
		{
			cube = new Cube(null, 200, 200, 200);
			s3d.add(cube);
		}
		
		override protected function _enterframe(e:Event):void 
		{
			//cube.rotation.x += 0.05;
			//cube.rotation.y += 0.05;
			//cube.rotation.z += 0.05;
			
			cube.z = 200;
			
			super._enterframe(null);
		}
		
	}

}