package simple3d.core 
{
	import flash.display.Bitmap;
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
		public function ExModel() 
		{
			//parser(pvtx, ptriangle, puv, (new cls() as Bitmap).bitmapData, pscale, poffset);
		}
		
		
		
		/**
		 * make vertices & polygons from the DAE raw data
		 * @param	cls BitmapClass
		 * @param	pvtx list of vertices in format [x,y,z,  x,y,z, ...]
		 * @param	puv list of uv in format [u,v, u,v, u,v, ...]
		 * @param	pIndices list polygons in format [vId,uvId, vId,uvId, ...]
		 * @param	pvpp vertices per polygon - can be an Array, if there is different number of vertices per polygon or an int > 3 if all is the same
		 */
		public function parse(cls: Class, pvtx: Array, puv: Array, pIndices: Array, pscale : Number, poffset: V3D = null, pvpp : * = 3): void {
			var texture : BitmapData = (new cls() as Bitmap).bitmapData;
			
			var i : int;
			var l : int;
			
			if (!poffset) poffset = new V3D();
			
			l = pvtx.length;
			for (i = 0; i < l; i += 3) {//create vertices
				_vertices.push(new Vertex(pvtx[i] * pscale + poffset.x, pvtx[i + 1] * pscale +poffset.y, pvtx[i + 2] * pscale + poffset.z))
			}
			
			l = pIndices.length;
			for (i = 0; i < l; i += 6) {
				_faces.push(new Polygon(texture,
						Vector.<Vertex>([
										vertices[pIndices[i]], vertices[pIndices[i + 2]], vertices[pIndices[i + 4]]
									]),
						Vector.<int>([0,1,2]),//adjust normal ???
						Vector.<Number>([	puv[pIndices[i + 1] * 2], 1 - puv[pIndices[i +1] * 2 + 1]
										,	puv[pIndices[i + 3] * 2], 1 - puv[pIndices[i + 3] * 2 + 1]
										,	puv[pIndices[i + 5] * 2], 1 - puv[pIndices[i + 5] * 2 + 1]
									])
						));
			}
		}
		
		
		/**
		 * duplicate indices in vertices-indices only array of polygons so it contains vertices indices + uvIndices
		 * @param	ppolygon in format [vId, vId, vId ...]
		 * @return format [vId, uvId, vId, uvId]
		 */
		public static function addPolygonUV(ppolygon: Array): Array {
			var arr : Array = [];
			var l: int = ppolygon.length;
			
			for (var i: int = 0; i < l; i++) {//structure : vertex - normal - texture
				arr.push(ppolygon[i], ppolygon[i]);
			}
			return arr;
		}
	}

}