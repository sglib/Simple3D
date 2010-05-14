package simple3d.core 
{
	import flash.display.BitmapData;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 */
	public class Polygon
	{
		public var vertices	: Vector.<Vertex>; //should be planar polygon
		public var texture	: BitmapData; //bitmap material
		
		public var renderData	: Vector.<Number>;//rendering data
		public var indices		: Vector.<int>;
		public var uv			: Vector.<Number>;
		
		public var z			: int; /* sorting */
		
		public function Polygon(ptexture: BitmapData, pvertices: Vector.<Vertex>, pindices: Vector.<int> = null, puv: Vector.<Number> = null)
		{
			vertices = pvertices;
			texture = ptexture;
			renderData = new Vector.<Number>();
			
			if (vertices.length == 4 && pindices == null && puv == null) {
				indices = Vector.<int>([0, 1, 3, 1, 2, 3]);
				uv = Vector.<Number>([0,0, 1,0, 1,1, 0,1]);				
			}
			
			//uv.fixed = true;
			//vertices.fixed = true;
		}
		
		public function updateRenderData():void {
			var l 	: int = vertices.length;
			var v	: Vertex;
			var tz	: Number = 0;
			
			renderData = new Vector.<Number>();
			
			for (var i: int = 0; i < l; i++) {
				v = vertices[i]
				tz += v.tz;
				renderData.push(v.gx, v.gy);
			}
			
			z = tz / l;
			//trace(z);
			//TODO : find t in uvt for each point
		}
		
	}

}