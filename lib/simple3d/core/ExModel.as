package simple3d.core 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.GradientType;
	import flash.display.Shape;
	import simple3d.utils.ModelParser;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 10 May 2010 (0.1.0)
	 */
	public class ExModel extends Object3D
	{
		public function ExModel(parser: Function, cls: Class, pvtx: Array, ptriangle: Array, puv: Array, pscale: Number = 0.1, poffset:V3D = null) 
		{
			parser(pvtx, ptriangle, puv, (new cls() as Bitmap).bitmapData, pscale, poffset);
			_vertices = ModelParser.vertices;
			_faces = ModelParser.faces;
		}		
	}

}