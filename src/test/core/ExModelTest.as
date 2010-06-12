package test.core
{
	import flash.events.Event;
	import model.Ball;
	import model.Car;
	import model.Cloth;
	import model.Cow;
	import model.Chessboard;
	import model.Kappa;
	import simple3d.core.Container3D;
	import simple3d.core.Model3D;
	import simple3d.core.Object3D;
	import simple3d.primity.Plane;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 10 May 2010 (0.1.0)
	 */
	public class ExModelTest extends Simple3DTest
	{
		public function ExModelTest() 
		{
			trace('nVertices :: ', target.vertices.length, ' nPolygons :: ', target.faces.length);
		}
		
		
		
		override public function setup3d():Object3D 
		{
			//s3d.showGrid = true;
			
			//return new Kappa();
			//return new Ball();
			//return new Cow();
			//return new Car();
			
			//return new Cloth().plane;
			
			//var obj3d : Model3D = new Model3D();
			//
			//for (var i: int = 0; i < 10; i++) {
				//var c : Chessboard = new Chessboard();
				//c.x = -350 + 100 * i;
				//c.z = 200 * (i % 2);
				//obj3d.add(c);
			//}
			//
			//return obj3d;
		}
	}

}