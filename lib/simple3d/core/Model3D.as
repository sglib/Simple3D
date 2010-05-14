package simple3d.core 
{
	import simple3d.utils.MathUtils;
	import simple3d.utils.VectorUtils;
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
		public function Model3D() 
		{
			super();
		}
		
		public function add(o: Object3D): void {
			VectorUtils.appendVertices(_vertices, o.vertices);//update vertices
			VectorUtils.appendPolygon(_faces, o.faces);
			//apply local transform
			
			MathUtils.findTrans(o.transL, o.rotation, o);
			MathUtils.transVertices(o.transL, o.vertices);
			
			var v : Vertex;
			for (var i: int = 0; i < o.vertices.length; i++) {
				v = o.vertices[i];
				v.x = v.tx;
				v.y = v.ty;
				v.z = v.tz;
				
				v.ox = v.x;
				v.oy = v.y;
				v.oz = v.z;
			}
		}
		
	}

}