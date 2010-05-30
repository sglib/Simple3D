package test.core
{
	import flash.events.Event;
	import model.Kappa;
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
			
		}
		
		protected var kappa : Kappa;
		
		override public function setup3d():Object3D 
		{
			kappa = new Kappa();
			kappa.rotation.y = Math.PI / 2;
			kappa.y = -200;
			return kappa
		}
	}

}