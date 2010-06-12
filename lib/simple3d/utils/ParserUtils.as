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
				arr.push(pindices[i][0]-1, i * 3, pindices[i][2]-1, i * 3 + 2, pindices[i][1]-1, i * 3 + 1);
			}
			trace('Roxik Indices :: [', arr,']');
			return arr;
		}
		
		public static function traceMaxMin(arr: Array):Array {
			var maxX : Number = 0;
			var maxY : Number = 0;
			var maxZ : Number = 0;
			var minX : Number = 100;
			var minY : Number = 100;
			var minZ : Number = 100;
			
			var l: int = arr.length;
			
			for (var i: int = 0; i < l; i += 3) {
				maxX = Math.max(maxX, arr[i]);
				maxY = Math.max(maxY, arr[i+1]);
				maxZ = Math.max(maxZ, arr[i+2]);
				minX = Math.min(minX, arr[i]);
				minY = Math.min(minY, arr[i+1]);
				minZ = Math.min(minZ, arr[i+2]);
			}
			//trace(maxX, minX, maxY, minY, maxZ, minZ);
			trace('Translate Vector :: ' + -(maxX + minX) / 2 + ',' + -(maxY + minY) / 2 + ',' + -(maxZ + minZ) / 2);
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

