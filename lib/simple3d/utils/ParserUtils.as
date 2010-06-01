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
	public class ParserUtils
	{
		
		//public static function fromRoxik(pvtx: Array, ptriangle: Array, puv: Array, ptexture: BitmapData, pscale: Number = 0.1, poffset:V3D = null):void {
			//var l0	: int = pvtx.length;
			//var di	: Array;
			//
			//vertices = new Vector.<Vertex>();
			//faces = new Vector.<Polygon>();
			//if (!poffset) poffset = new V3D();
			//
			//for (var i: int = 0; i < l0; i++ ) {
				//di = pvtx[i];
				//vertices.push(new Vertex(di[0] * pscale + poffset.x, -di[1] * pscale + poffset.y, di[2] * pscale + poffset.z));
			//}
			//
			//var l : int = ptriangle.length;
			//var k : int;
				//
			//for (i = 0; i < l; i++) {
				//di = ptriangle[i];
				//faces.push(new Polygon(ptexture,
								//Vector.<Vertex>([vertices[di[0] - 1], vertices[di[1] - 1], vertices[di[2] - 1]]),
								//Vector.<int>([0,2,1]),
								//Vector.<Number>([puv[k][0], 1-puv[k][1], puv[k+1][0], 1-puv[k+1][1], puv[k+2][0], 1-puv[k+2][1]])
							//));
				//k += 3;
			//}
		//}
		
		//public static function fromRoxik(pdelta: int, pvtx: Array): Array {
			//var arr : Array = [];
			//var l	: int = pvtx.length;
			//var is3	: Boolean = pvtx[0].length == 3;
			//var tmp : Array;
			//
			//for (var i: int = 0; i < l; i++) {
				//tmp = pvtx[i];
				//is3 ? arr.push(tmp[0]+pdelta, tmp[1]+pdelta, tmp[2]+pdelta) : arr.push(tmp[0], tmp[1]);
			//}
			//trace('roxik :: ', pvtx.length, "[", arr,']');
			//return arr;
		//}
		
		//public static function uvRoxik(ppolygon: Array): Array {
			//var arr : Array = [];
			//var l : int = ppolygon.length;
			//
			//for (var i: int = 0; i < l; i ++) {
				//arr.push(ppolygon[i], i);
			//}
			//return arr;
		//}
		
		public static function roxik_uv(puv : Array): Array {
			var l	: int = puv.length;
			var arr : Array = [];
			for (var i: int = 0; i < l; i++) {
				arr.push(puv[i][0], puv[i][1]);
			}
			trace('Roxik UV :: [', arr,']');
			return arr;
		}
		
		public static function roxik_vertices(pvertices: Array): Array {
			var l	: int = pvertices.length;
			var arr : Array = [];
			for (var i: int = 0; i < l; i++) {
				arr.push(pvertices[i][0], -pvertices[i][1], pvertices[i][2]); //reverse y
			}
			trace('Roxik Vertices :: [', arr,']');
			return arr;
		}
		
		public static function roxik_indices(pindices: Array):Array {
			var l	: int = pindices.length;
			var arr : Array = [];
			for (var i: int = 0; i < l; i++) {
				//arr.push(pindices[i][0]-1, i * 3, pindices[i][1]-1, i * 3 + 1, pindices[i][2]-1, i * 3 + 2);
				arr.push(pindices[i][0]-1, i * 3, pindices[i][2]-1, i * 3 + 2, pindices[i][1]-1, i * 3 + 1);
			}
			trace('Roxik Indices :: [', arr,']');
			return arr;
		}
		
		public static function compress(ptotal: int = 3, poff: int = 3, pindices: Array = null):Array {
			var get0 : Boolean = (poff & 1) != 0;
			var get1 : Boolean = (poff & 2) != 0;
			var get2 : Boolean = (poff & 4) != 0;
			
			if (get0 && get1 && get2 && ptotal == 3) return pindices;
			if (get0 && get1 && ptotal == 2) return pindices;
			
			var arr : Array = [];
			var l : int = pindices.length;
			for (var i: int = 0; i <l; i += ptotal) {//structure : vertex - normal - texture
				if (get0) arr.push(pindices[i]);
				if (get1) arr.push(pindices[i + 1]);
				if (get2) arr.push(pindices[i + 2]);
			}
			trace('compressed array ::\n ['+arr+']');
			return arr;
		}
		
	}
}

