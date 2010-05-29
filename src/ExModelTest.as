package  
{
	import flash.events.Event;
	import model.Kappa;
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
		
		override public function setup3d():void 
		{
			kappa = new Kappa(bm);
			
			s3d.add(kappa);
		}
	}

}