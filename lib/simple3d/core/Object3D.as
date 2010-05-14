package simple3d.core 
{
	import flash.geom.Matrix3D;
	import simple3d.utils.MathUtils;
	import simple3d.utils.VectorUtils;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 * 
	 */
	public class Object3D extends Vertex
	{
		public var rotation : V3D;
		public var scale	: V3D;
		
		public var parent	: Container3D;
		public var transG	: Vector.<Number>; //global transform
		public var transL	: Vector.<Number>; //local transform
		
		protected var _isdTrans		: Boolean; //transform dirty
		protected var _isdVerties	: Boolean; //vertices dirty
		protected var _isdFaces		: Boolean; //faces dirty
		
		protected var _vertices 	: Vector.<Vertex>; //cached
		protected var _faces		: Vector.<Polygon>; //if dirty it will automatically call sort
		
		public function Object3D(pvertices: Vector.<Vertex> = null, pfaces: Vector.<Polygon> = null)
		{
			_vertices = pvertices ? pvertices: new Vector.<Vertex>();
			_faces = pfaces ? pfaces : new Vector.<Polygon>();
			
			transG = new Matrix3D().rawData;
			transL = new Matrix3D().rawData;
			
			//_oRotation = new V3D();
			rotation = new V3D(0, 0, 0);
			scale = new V3D(1, 1, 1);
		}
		
		public function offset(dx: int = 0, dy: int = 0, dz: int = 0):void {
			var v : Vertex;
			
			for (var i: int = 0; i < _vertices.length; i++) {
				v = _vertices[i];
				v.ox += dx;
				v.oy += dy;
				v.oz += dz;
			}
			_isdFaces = true;
			//_isdVerties = true;
			_isdTrans = true;
		}
		
		
		public function updateTransform(): void {
			//if (_isdTrans) {//only update if local transform is dirty (changed in rotation, position, scale)
				MathUtils.findTrans(transL, rotation, this);
			//}
			
			//parent only call children's update transform if its transform is dirty
			//means that child's transG is always dirty and need to be updated
			VectorUtils.copyNumber(transG, transL);
			if (parent) {
				MathUtils.prependTrans(parent.transG, transG);
				//MathUtils.transVertex(parent.transG, this);
			}
			
			MathUtils.transVertex(transG, this);
			
			_isdFaces = true;
			
			//update vertices's transformation
			if (!(this is Container3D)) { MathUtils.transVertices(transG, _vertices);}
		}
		
		override public function toString():String { return '[Object3D x : '+ x + ' y : '+ y + ' z : '+ z + ']' ; }
		
		public function get vertices():Vector.<Vertex> {
			//can not dirty for Object3D !!!
			return _vertices;
		}
		
		public function get faces():Vector.<Polygon> { 
			if (_isdFaces) {
				VectorUtils.sortFaces(_faces);
				_isdFaces = false;
			}
			return _faces;
		}
	}

}