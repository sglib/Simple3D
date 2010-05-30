package simple3d.utils 
{
	import flash.utils.Dictionary;
	import simple3d.core.Vertex;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 18 May 2010 (0.1.0)
	 */
	public class VertexWelder
	{
		protected var _vertices	: Vector.<Vertex>;
		protected var _tolerant	: int = 2;
		
		public function VertexWelder() 
		{
			_vertices = new Vector.<Vertex>();
		}
		
		public function add(v: Vertex): Vertex {
			var ov 		: Vertex;
			var delta 	: int;
			
			for (var i: int = 0; i < _vertices.length; i++) {
				ov = _vertices[i];
				delta = Math.abs(ov.x - v.x) + Math.abs(ov.y - v.y) + Math.abs(ov.z - v.z);
				if (delta < _tolerant) {
					trace('weld sucess :: ', v, ' to ', ov);
					return ov;
				}
			}
			
			_vertices.push(v);//push new
			return null;//weld fail
		}
		
		public function get vertices():Vector.<Vertex> { return _vertices; }		
	}

}