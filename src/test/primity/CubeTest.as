package test.primity
{
	import flash.events.Event;
	import simple3d.core.Object3D;
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
		
		override public function setup3d():Object3D 
		{
			cube = new Cube(null, 200, 200, 200);
			return cube;
		}
	}

}