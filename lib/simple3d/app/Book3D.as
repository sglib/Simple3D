package simple3d.app 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Vector3D;
	import simple3d.core.Container3D;
	import simple3d.core.Model3D;
	import simple3d.core.Object3D;
	import simple3d.core.Polygon;
	import simple3d.core.V3D;
	import simple3d.core.Vertex;
	import simple3d.primity.Plane;
	import simple3d.utils.MathUtils;
	import simple3d.utils.VectorUtils;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 */
	public class Book3D extends Model3D
	{
		public var angle			: Number;
		
		public var leftPage			: Plane;
		public var rightPage		: Plane;
		
		public var _facesObject		: Vector.<Polygon>;
		
		public function Book3D(bm : BitmapData, w : int, h: int) 
		{
			super();			
			angle = Math.PI;
			
			_facesObject = new Vector.<Polygon>;
			
			leftPage = new Plane(bm, w, h);
			leftPage.x = -100;
			leftPage.rotation.y = Math.PI / 2;
			leftPage.rotation.z = Math.PI / 2;
			
			rightPage = new Plane(bm, w, h);
			rightPage.x = 100;
			rightPage.rotation.y = Math.PI / 2;
			rightPage.rotation.z = Math.PI / 2;
			
			add(leftPage);
			add(rightPage);
		}
		
		override public function add(o:Object3D):void 
		{
			super.add(o);
			
			if (o != leftPage && o != rightPage) {
				VectorUtils.appendPolygon(_facesObject, o.faces);
			}
		}
		
		override public function updateTransform():void 
		{
			var angRatio : Number = (Math.PI - angle) / Math.PI;
			var k		: Number;
			var v		: Vertex;
			
			for (var i: int = 0; i < _vertices.length; i++) {
				v = _vertices[i];
				v.x = v.ox;
				v.z = v.oz;
				
				//morphing
				v.y = v.oy * angRatio;
				MathUtils.rotateZVertex(v, angle * Math.atan2(Math.abs(v.y), v.x) / Math.PI);
			}
			
			super.updateTransform();
		}
		
		override public function get faces():Vector.<Polygon> {
			if (_isdFaces) {
				var leftFirst : Boolean = leftPage.faces[0].z > rightPage.faces[0].z;
				
				VectorUtils.sortFaces(_facesObject);
				_faces = new Vector.<Polygon>();
				
				//WISE Plane sorting
				if (leftFirst) {
					_faces.push(leftPage.faces[0]);
					_faces.push(rightPage.faces[0]);
					VectorUtils.appendPolygon(_faces, _facesObject);
					_faces.push(leftPage.faces[1]);
					_faces.push(rightPage.faces[1]);
				} else {
					_faces.push(rightPage.faces[0]);
					_faces.push(leftPage.faces[0]);
					VectorUtils.appendPolygon(_faces, _facesObject);
					_faces.push(rightPage.faces[1]);
					_faces.push(leftPage.faces[1]);
				}
				
				_isdFaces = false;
			}
			return _faces;
		}
		
		
	}

}