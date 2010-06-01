package test.core
{
	import flash.events.Event;
	import model.Ball;
	import model.Car;
	import model.Cow;
	import model.Kappa;
	import simple3d.core.Container3D;
	import simple3d.core.Model3D;
	import simple3d.core.Object3D;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 10 May 2010 (0.1.0)
	 */
	public class ExModelTest extends Simple3DTest
	{
		public function ExModelTest() 
		{
			target.y = -200;
		}
		
		override public function setup3d():Object3D 
		{
			//s3d.showGrid = true;
			
			return new Kappa();
			//return new Ball();
			//return new Cow();
			//return new Car();
		}
	}

}