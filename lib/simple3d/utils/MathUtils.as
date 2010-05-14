package simple3d.utils
{
	import flash.display.MovieClip;
	import flash.geom.Matrix3D;
	import simple3d.core.V3D;
	import simple3d.core.Vertex;
	import simple3d.primity.Cube;
	import simple3d.primity.Plane;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 */
	public class MathUtils
	{
		public static function transVertex(trans: Vector.<Number>, v: Vertex): void {
			v.tx = trans[0] * v.x + trans[1] * v.y + trans[2] * v.z  + trans[3];
			v.ty = trans[4] * v.x + trans[5] * v.y + trans[6] * v.z  + trans[7];
			v.tz = trans[8] * v.x + trans[9] * v.y + trans[10] * v.z + trans[11];
			
			//if (v is Plane || v is Cube) trace(v, v.tx, v.ty, v.tz);
		}
		
		public static function transVertices(trans: Vector.<Number>, vv: Vector.<Vertex>):void {
			var v	: Vertex;
			
			for (var i: int = 0 ; i < vv.length; i++) {
				v = vv[i];
				v.tx = trans[0] * v.x + trans[1] * v.y + trans[2] * v.z  + trans[3];
				v.ty = trans[4] * v.x + trans[5] * v.y + trans[6] * v.z  + trans[7];
				v.tz = trans[8] * v.x + trans[9] * v.y + trans[10] * v.z + trans[11];
			}
		}
		
		public static function findTrans(trans: Vector.<Number>, r: V3D, p: V3D = null): Vector.<Number> {
			//var r2 : V3D = new V3D(-r.y, r.z, r.x);
			//r = r2;
			
			var fSinPitch       : Number = Math.sin( -r.y * 0.5 );
			var fCosPitch       : Number = Math.cos( -r.y * 0.5 );
			var fSinYaw         : Number = Math.sin( r.z * 0.5 );
			var fCosYaw         : Number = Math.cos( r.z * 0.5 );
			var fSinRoll        : Number = Math.sin( r.x * 0.5 );
			var fCosRoll        : Number = Math.cos( r.x * 0.5 );
			var fCosPitchCosYaw : Number = fCosPitch * fCosYaw;
			var fSinPitchSinYaw : Number = fSinPitch * fSinYaw;
			
			var x : Number = fSinRoll * fCosPitchCosYaw     - fCosRoll * fSinPitchSinYaw;;
			var y : Number = fCosRoll * fSinPitch * fCosYaw + fSinRoll * fCosPitch * fSinYaw;;
			var z : Number = fCosRoll * fCosPitch * fSinYaw - fSinRoll * fSinPitch * fCosYaw;;
			var w : Number = fCosRoll * fCosPitchCosYaw     + fSinRoll * fSinPitchSinYaw;
			
			var xx:Number = x * x; 
			var xy:Number = x * y; 
			var xz:Number = x * z; 
			var xw:Number = x * w; 
			var yy:Number = y * y; 
			var yz:Number = y * z; 
			var yw:Number = y * w; 
			var zz:Number = z * z; 
			var zw:Number = z * w; 
			
			trans[0] = 1 - 2 * ( yy + zz );
			trans[1] =     2 * ( xy - zw );
			trans[2] =     2 * ( xz + yw );
			trans[3] = (p) ? p.x : 0;
			
			trans[4] =     2 * ( xy + zw );
			trans[5] = 1 - 2 * ( xx + zz );
			trans[6] =     2 * ( yz - xw );
			trans[7] = (p) ? -p.y : 0;
			
			trans[8] =     2 * ( xz - yw );
			trans[9] =     2 * ( yz + xw );
			trans[10] = 1 - 2 * ( xx + yy );
			trans[11] = (p) ? p.z : 0;
			
			trans[12] = 0;
			trans[13] = 0;
			trans[14] = 0;
			trans[15] = 1;
			
			return trans;
		}
		
		public static function rotateZVertices(vv: Vector.<Vertex>, angleZ : Number):void {
			var v : Vertex;
			var cos : Number = Math.cos(angleZ);
			var sin : Number = Math.sin(angleZ);
			var x : Number;
			var y : Number;
			
			
			for (var i:int = 0; i < vv.length; i++) {
				v = vv[i];
				
				x = v.x;
				y = v.y;
				
				v.x = x * cos - y * sin;
				v.y = x * sin + y * cos;
			}
		}
		
		public static function rotateZVertex(v: Vertex, angleZ : Number):void {
			var x : Number = v.x;
			var y : Number = v.y;
			var sin : Number = Math.sin(angleZ);
			var cos : Number = Math.cos(angleZ);
			
			v.x = x * cos - y * sin;
			v.y = x * sin + y * cos;
		}
		
		public static function prependTrans(pTrans: Vector.<Number>, lTrans: Vector.<Number>):void {
			
			var ma : Matrix3D = new Matrix3D();			
			ma.rawData = pTrans;
			var mb : Matrix3D = new Matrix3D();
			mb.rawData = lTrans;
			
			ma.append(mb);
			
			VectorUtils.copyNumber(lTrans, ma.rawData);
		}
	}

}