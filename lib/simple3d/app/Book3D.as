package simple3d.app 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
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
		
		public function Book3D(bm : BitmapData, w : int = -1, h: int = -1) 
		{
			super();			
			angle = Math.PI;
			
			_facesObject = new Vector.<Polygon>;
			
			if (w == -1) w = bm.width;
			if (h == -1) h = bm.height;
			if (bm == null) bm = new BitmapData(w * 2, h, false, Math.random() * 0xffffff);
			
			var hw : int = w >> 1;
			
			var bm1 : BitmapData = new BitmapData(hw, h, bm.transparent);
			bm1.copyPixels(bm, new Rectangle(0,0, hw, h), new Point(0,0));
			
			leftPage = new Plane(bm1, hw, h, new BitmapData(hw, h, false, 0x0000ff));
			leftPage.x = -w / 4 ;
			leftPage.rotation.x = -Math.PI / 2;
			
			var bm2 : BitmapData = new BitmapData(hw, h, bm.transparent);
			bm2.copyPixels(bm, new Rectangle(hw, 0, hw, h), new Point(0, 0));
			
			rightPage = new Plane(bm2, hw, h, new BitmapData(hw, h, false, 0x0000ff));
			rightPage.x = w / 4;
			rightPage.rotation.x = -Math.PI / 2;
			
			add(leftPage);//2 points will be welded here
			_useWelder = true;
			add(rightPage);
			_useWelder = false;//no need to weld other objects' vertices
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
				
				//WISE Plane sorting : dual faces planes
				if (leftFirst) {
					_faces.push(leftPage.faces[0]);
					_faces.push(rightPage.faces[0]);
					if (angle < Math.PI) VectorUtils.appendPolygon(_faces, _facesObject);
					_faces.push(leftPage.faces[1]);
					_faces.push(rightPage.faces[1]);
				} else {
					_faces.push(rightPage.faces[0]);
					_faces.push(leftPage.faces[0]);
					if (angle < Math.PI) VectorUtils.appendPolygon(_faces, _facesObject);//
					_faces.push(rightPage.faces[1]);
					_faces.push(leftPage.faces[1]);
				}
				
				_isdFaces = false;
			}
			return _faces;
		}
		
		
	}

}