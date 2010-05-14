package simple3d.utils 
{
	import simple3d.core.Object3D;
	import simple3d.core.Polygon;
	import simple3d.core.Vertex;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 */
	public class VectorUtils
	{
		public static function appendPolygon(pa: Vector.<Polygon>, pb: Vector.<Polygon>): Vector.<Polygon>
		{
			var l : int = pb.length;
			for (var i: int = 0; i < l ; i++) {
				pa.push(pb[i]);
			}
			return pa;
		}
		
		public static function appendVertices(pa: Vector.<Vertex>, pb: Vector.<Vertex>): Vector.<Vertex>
		{
			var l : int = pb.length;
			for (var i: int = 0; i < l ; i++) {
				pa.push(pb[i]);
			}
			return pa;
		}
		
		public static function removeVertices(psrc: Vector.<Vertex>, prem: Vector.<Vertex>): Vector.<Vertex> {
			var id : int = psrc.indexOf(prem[0]);//prem should be continuos from psrc
			if (id != -1) psrc.splice(id, prem.length);
			return psrc;
		}
		
		public static function copyNumber(pa: Vector.<Number>, pb: Vector.<Number>): Vector.<Number> {
			var l : int = Math.min(pa.length, pb.length);
			
			for (var i: int = 0; i < l ; i++) {
				pa[i] = pb[i];
			}
			return pa;
		}
		
		public static function sortFaces(faces: Vector.<Polygon>):Vector.<Polygon> {
			faces.sort(function (a: Polygon, b: Polygon): int {
					return a.z > b.z ? -1 : 1;
				}
			)
			return faces;
		}
		
		public static function sortObjectsFaces(objects: Array):Vector.<Polygon> {
			objects.sortOn('tz', Array.NUMERIC | Array.DESCENDING);
			
			var faces : Vector.<Polygon> = new Vector.<Polygon>();
			var l : int = objects.length;
			var s : String = '';
			
			//trace('sort');
			
			for (var i: int = 0; i < l; i++) {
				s += objects[i].tz + ' :: ';
				appendPolygon(faces, (objects[i] as Object3D).faces);
			}
			
			//trace('SORT :: ', s);
			return faces;
		}
		
	}

}