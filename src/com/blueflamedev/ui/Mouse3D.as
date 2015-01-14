package com.blueflamedev.ui
{
	import com.blueflamedev.math.Vector3D;
	
	import flash.display.DisplayObject;
	
	public class Mouse3D
	{
		public static var z:Number = 0;
		
		public static function getPos(displayObject:DisplayObject):Vector3D
		{
			var vector:Vector3D = new Vector3D(displayObject.mouseX, displayObject.mouseY, z);
			return vector.project(vector.getPerspective());
		}
	}
}