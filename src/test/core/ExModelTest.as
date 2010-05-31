package test.core
{
	import flash.events.Event;
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
			
		}
		
		protected var kappa : Kappa;
		protected var cow	: Cow;
		
		override public function setup3d():Object3D 
		{
			s3d.showGrid = true;
			
			var m3d : Model3D = new Model3D();
			
			kappa = new Kappa();
			kappa.y = -200;
			
			cow = new Cow(100);
			cow.y = -200;
			
			m3d.add(kappa);
			m3d.add(cow);
			
			//return kappa;
			return m3d;
		}
	}

}