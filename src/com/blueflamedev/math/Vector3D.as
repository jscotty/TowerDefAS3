package com.blueflamedev.math
{
	/**
	 * Contains a reference to X, Y, and Z coordinates and functions to manipulate them.
	 * 
	 * @author Eric Smith
	 */	
	public class Vector3D
	{
		public var x:Number;
		public var y:Number;
		public var z:Number;
		
		/**
		 * Creates a new Vector3D object.  
		 * @param x The object's horizontal location.
		 * @param y The object's vertical location.
		 * @param z The object's depth location.
		 * 
		 */		
		public function Vector3D(x:Number=0, y:Number=0, z:Number=0)
		{
			this.x = x;
			this.y = y;
			this.z = z;
		}
		
		/**
		 * Adds the value of a vector to this vector.
		 * 
		 * @param vector A 3D vector object
		 */		
		public function plusEquals(vector:Vector3D):void
		{
			x += vector.x;
			y += vector.y;
			z += vector.z;
		}
		
		/**
		 * Adds the value of a vector to a new vector object.
		 * 
		 * @param vector A 3D vector object
		 */
		public function plus(vector:Vector3D):Vector3D
		{
			return new Vector3D(x + vector.x, y + vector.y, z + vector.z);
		}
		
		/**
		 * Subtracts the value of a vector to this vector.
		 * 
		 * @param vector A 3D vector object
		 */
		public function minusEquals(vector:Vector3D):void
		{
			x -= vector.x;
			y -= vector.y;
			z -= vector.z;
		}
		
		/**
		 * Subtracts the value of a vector to a new vector object.
		 * 
		 * @param vector A 3D vector object
		 */
		public function minus(vector:Vector3D):Vector3D
		{
			return new Vector3D(x - vector.x, y - vector.y, z - vector.z);
		}
		
		public function scaleEquals(number:Number):void
		{
			x *= number;
			y *= number;
			z *= number;
		}
		
		/**
		 * Changes the length of the vector by the ratio specified
		 * 
		 * @param ratio The proportional new length.
		 */
		public function scale(ratio:Number):Vector3D
		{
			return new Vector3D(x * ratio, y * ratio, z * ratio);
		}
		
		/**
		 * The length of the vector.
		 * 
		 * @return The length of the vector.
		 */		
		public function get length():Number
		{
			return Math.sqrt(x * x + y * y + z * z);
		}
		
		public function set length(value:Number):void
		{
			if (length != 0)
				scaleEquals(value / length);
			else
				x = value;
		}
		
		/**
		 * Retrieves the dot product in relation to another vector.
		 * 
		 * @param vector A 3D vector object.
		 * @return A scalar number representing the dot product of the two vectors.
		 */		
		public function dotProduct(vector:Vector3D):Number
		{
			return x * vector.x + y * vector.y + z * vector.z;
		}
		
		/**
		 * Retrieves the cross product for the two vectors. Useful for backface culling, I've heard.
		 * 
		 * @param vector a 3D vector object.
		 * @return A new vector perpendicular to both vectors.
		 */		
		public function crossProduct(vector:Vector3D):Vector3D
		{
			return new Vector3D((y * vector.z - z * vector.y),
								(z * vector.x - x * vector.z),
								(x * vector.y - y * vector.x));
		}
		
		/**
		 * Finds the angle between two 3D vectors. 
		 * 
		 * @param vector A 3D vector object
		 * @return An angle in radians.
		 * 
		 */		
		public function angleBetween(vector:Vector3D):Number
		{
			return Math.acos(dotProduct(vector) / (length * vector.length));
		}
		
		/**
		 * <code>getPerspective()</code> is useful for obtaining the size to scale your display object based on its position in 3D space.
		 * 
		 * @param viewDist A good value is 300. A small value makes z-axis changes more noticable, producing a fish-eye effect.
		 * @return A ratio of actual size to 3D size
		 */		
		public function getPerspective(viewDist:Number=300):Number
		{
			return viewDist / (z + viewDist);
		}
		
		/**
		 * Flattens the Z coordinate and adjusts the X and Y coordinates. Use for finding your sprite's proper position on the stage.
		 * 
		 * @param perspective The scale of the display object. Use <code>getPerspective()</code> to get the perspective.
		 * @see getPerspective
		 */		
		public function projectEquals(perspective:Number):void
		{
			x *= perspective;
			y *= perspective;
			z = 0;
		}
		
		/**
		 * Flattens the Z coordinate and adjusts the X and Y coordinates. Use for finding your sprite's proper position on the stage.
		 * 
		 * @param perspective The scale of the display object. Use <code>getPerspective()</code> to get the perspective.
		 * @see getPerspective
		 */	
		public function project(perspective:Number):Vector3D
		{
			return new Vector3D(x * perspective, y * perspective, 0);
		}
		
		/**
		 * Rotates the vector on the X axis (imagine riding a ferris wheel).
		 * 
		 * @param angle The angle (in radians) to rotate the vector
		 */
		public function rotateX(angle:Number):void
		{
			var ty:Number = y * Math.cos(angle) - z * Math.sin(angle);
			var tz:Number = y * Math.sin(angle) + z * Math.cos(angle);
			
			y = ty;
			z = tz;
		}
		
		/**
		 * Rotates the vector on the X axis (imagine riding a ferris wheel).
		 * More effecient than <code>rotateX()</code> if the sin and cosine values can be stored, saving calculations
		 * 
		 * @param cosAngle The cosine of the angle to rotate.
		 * @param sinAngle The sin of the angle to rotate.
		 */
		public function rotateXTrig(cosAngle:Number, sinAngle:Number):void
		{
			var ty:Number = y * cosAngle - z * sinAngle;
			var tz:Number = y * sinAngle + z * cosAngle;
			
			y = ty;
			z = tz;
		}
		
		/**
		 * Rotates the vector on the X axis (imagine riding a ferris wheel).
		 * 
		 * @param angle The angle (in radians) to rotate the vector
		 */
		public function rotateY(angle:Number):void
		{
			var tx:Number = x * Math.cos(angle) + z * Math.sin(angle);
			var tz:Number = x * -Math.sin(angle) + z * Math.cos(angle);
			
			x = tx;
			z = tz;
		}
		
		/**
		 * Rotates the vector on the Y axis (imagine riding a merry go round).
		 * More effecient than <code>rotateY()</code> if the sin and cosine values can be stored, saving calculations
		 * 
		 * @param cosAngle The cosine of the angle to rotate.
		 * @param sinAngle The sin of the angle to rotate.
		 */
		public function rotateYTrig(cosAngle:Number, sinAngle:Number):void
		{
			var tx:Number = x * cosAngle + z * sinAngle;
			var tz:Number = x * -sinAngle + z * cosAngle;
			
			x = tx;
			z = tz;
		}
		
		/**
		 * Rotates the vector on the Z axis (imagine watching the wheel of a hamster).
		 * 
		 * @param angle The angle (in radians) to rotate the vector
		 */
		public function rotateZ(angle:Number):void
		{
			var tx:Number = x * Math.cos(angle) - y * Math.sin(angle);
			var ty:Number = x * Math.sin(angle) + y * Math.cos(angle);
			
			x = tx;
			y = ty;
		}
		
		/**
		 * Rotates the vector on the Z axis (imagine watching the wheel of a hamster).
		 * More effecient than <code>rotateZ()</code> if the sin and cosine values can be stored, saving calculations
		 * 
		 * @param cosAngle The cosine of the angle to rotate.
		 * @param sinAngle The sin of the angle to rotate.
		 */
		public function rotateZTrig(cosAngle:Number, sinAngle:Number):void
		{
			var tx:Number = x * cosAngle - y * sinAngle;
			var ty:Number = x * sinAngle + y * cosAngle;
			
			x = tx;
			y = ty;
		}
		
		/** 
		 * Outputs the X, Y, and Z coordinates to a string.
		 */		
		public function toString():String
		{
			return "[" + Math.round(x) + ", " + Math.round(y) + ", " + Math.round(z) + "]";
		}

	}
}