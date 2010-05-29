package simple3d.core 
{
	import flash.display.BitmapData;
	import flash.display.GradientType;
	import flash.display.Shape;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 10 May 2010 (0.1.0)
	 */
	public class ExModel extends Object3D
	{
		protected var vDat	: Array;//vertices
		protected var fDat	: Array;//faces
		protected var uv	: Array;
		
		public var material : BitmapData;
		
		public function ExModel() 
		{
			_setData();
			parse();
			fDat = null;
			vDat = null;
			uv = null;
		}
		
		protected function _setData():void {
			
		}
		
		public function parse(): void {
			var l0	: int = vDat.length;
			var di	: Array;
			
			for (var i: int = 0; i < l0; i++ ) {
				di = vDat[i];
				_vertices.push(new Vertex(di[0]/10, -di[1]/10, di[2]/10));
			}
			
			var l : int = fDat.length;
			var k : int;
				
			for (i = 0; i < l; i++) {
				di = fDat[i];
				_faces.push(new Polygon(material,
								Vector.<Vertex>([_vertices[di[0] - 1], _vertices[di[1] - 1], _vertices[di[2] - 1]]),
								Vector.<int>([0,2,1]),
								Vector.<Number>([uv[k][0], 1-uv[k][1], uv[k+1][0], 1-uv[k+1][1], uv[k+2][0], 1-uv[k+2][1]])
							));
				k += 3;
			}
		}
		
	}

}