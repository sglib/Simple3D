package simple3d.utils 
{
	import flash.display.BitmapData;
	import simple3d.core.Polygon;
	import simple3d.core.V3D;
	import simple3d.core.Vertex;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 18 May 2010 (0.1.0)
	 */
	public class ModelParser
	{
		public static var vertices	: Vector.<Vertex>;
		public static var faces		: Vector.<Polygon>; 
		
		public static function fromDAE(pvtx: Array, ptriangle: Array, puv: Array, ptexture: BitmapData, pscale: Number = 100, poffset: V3D = null):void {
			if (puv.length / 2 != pvtx.length / 3) {
				trace('DAE Error :: nVertices should be equal with nUV :: nVertices :: ', pvtx.length / 3, ' nFaces :: ', ptriangle.length / 3, ' nUV :: ', puv.length / 2);
				return;
			}
			
			vertices = new Vector.<Vertex>();
			faces = new Vector.<Polygon>();
				
			var i: int;
			
			if (!poffset) poffset = new V3D();
			
			for (i = 0; i < pvtx.length; i += 3) {//create vertices
				vertices.push(new Vertex(pvtx[i] * pscale + poffset.x, pvtx[i + 1] * pscale +poffset.y, pvtx[i + 2] * pscale + poffset.z))
			}
			
			if (ptriangle[0] == ptriangle[1] == ptriangle[2]) {
				ptriangle = compressFaces(ptriangle);
				trace('ptriangle should be compressed - use this instead \n[', ptriangle,']');
			}
			
			for (i = 0; i < ptriangle.length; i += 3) {
				faces.push(new Polygon(ptexture,
						Vector.<Vertex>([
										vertices[ptriangle[i]], vertices[ptriangle[i + 1]], vertices[ptriangle[i + 2]]
									]),
						Vector.<int>([0,1,2]),//adjust normal ???
						Vector.<Number>([	puv[ptriangle[i] * 2], 1-puv[ptriangle[i] * 2 + 1]
										,	puv[ptriangle[i + 1] * 2], 1-puv[ptriangle[i + 1] * 2 + 1]
										,	puv[ptriangle[i + 2] * 2], 1-puv[ptriangle[i + 2] * 2 + 1]
									])
						));
			}
		}
		
		public static function fromRoxik(pvtx: Array, ptriangle: Array, puv: Array, ptexture: BitmapData, pscale: Number = 0.1, poffset:V3D = null):void {
			var l0	: int = pvtx.length;
			var di	: Array;
			
			vertices = new Vector.<Vertex>();
			faces = new Vector.<Polygon>();
			if (!poffset) poffset = new V3D();
			
			for (var i: int = 0; i < l0; i++ ) {
				di = pvtx[i];
				vertices.push(new Vertex(di[0] * pscale + poffset.x, -di[1] * pscale + poffset.y, di[2] * pscale + poffset.z));
			}
			
			var l : int = ptriangle.length;
			var k : int;
				
			for (i = 0; i < l; i++) {
				di = ptriangle[i];
				faces.push(new Polygon(ptexture,
								Vector.<Vertex>([vertices[di[0] - 1], vertices[di[1] - 1], vertices[di[2] - 1]]),
								Vector.<int>([0,2,1]),
								Vector.<Number>([puv[k][0], 1-puv[k][1], puv[k+1][0], 1-puv[k+1][1], puv[k+2][0], 1-puv[k+2][1]])
							));
				k += 3;
			}
		}
		
		protected static function compressFaces(ptriangle: Array):Array {
			var arr : Array = [];
			for (var i: int = 0; i < ptriangle.length; i += 3) {//structure : vertex - normal - texture
				arr.push(ptriangle[i]);
			}
			return arr;
		}
		
	}

}