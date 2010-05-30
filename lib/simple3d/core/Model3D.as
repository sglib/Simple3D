package simple3d.core 
{
	import flash.utils.Dictionary;
	import simple3d.utils.MathUtils;
	import simple3d.utils.VectorUtils;
	import simple3d.utils.VertexWelder;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 * 
	 * Model3D is used to bind vertices with transformation from objects into one Object3D
	 * Its Vertices currently won't be updated after the object is added into the model3D so you need to do all neccessary transformation before adding it
	 * For animation case we need to adding more functionality to this class
	 */
	public class Model3D extends Object3D
	{
		protected var welder 		: VertexWelder;
		protected var _useWelder 	: Boolean;
		
		public function Model3D() 
		{
			super();
			
			welder = new VertexWelder();
			_vertices = welder.vertices;//bind to welder's vertices			
		}
		
		public function add(o: Object3D): void {
			//apply local transform
			MathUtils.findTrans(o.transL, o.rotation, o);
			MathUtils.transVertices(o.transL, o.vertices);
			
			var v 		: Vertex;
			var list	: Dictionary = new Dictionary();
			
			for (var i: int = 0; i < o.vertices.length; i++) {
				v = o.vertices[i];
				
				v.x = v.tx;
				v.y = v.ty;
				v.z = v.tz;
				
				v.ox = v.x;
				v.oy = v.y;
				v.oz = v.z;
				
				if (_useWelder) VectorUtils.replacePolygonVertices(v, welder.add(v), o.faces);
			}
			
			if (!_useWelder) VectorUtils.appendVertices(_vertices, o.vertices);
			VectorUtils.appendPolygon(_faces, o.faces);
		}
		
		public function set useWelder(value:Boolean):void {	_useWelder = value; }
		
	}

}