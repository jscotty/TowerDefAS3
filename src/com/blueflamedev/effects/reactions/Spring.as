package com.blueflamedev.effects.reactions
{
	import com.blueflamedev.effects.Particle;

	/**
	 * A spring reaction attracts particles to one another through a spring-like relationship, where the further a particle is away from
	 * the others, the faster it gravitates toward them. 
	 * 
	 * <p><b>TO DO:</b>
	 * <ul>
	 * <li>Include a mass variable so that particles can have heavier or lighter spring attractions to one another.</li>
	 * </ul></p> 
	 * 
	 * @author Eric Smith
	 * 
	 */	
	public class Spring implements IReaction
	{
		/**
		 * How quickly the particles are attracted to each other. Use very low numbers close to 0.
		 * Higher numbers (such as .1) cause extreme stiffness (that's what she said).
		 */		
		public var stiffness:Number;
		
		/**
		 * The distance (in pixels) that a particle must be from its comparee in order to react.
		 */		
		public var tensionThreshold:Number;
		
		public function Spring(stiffness:Number = .005, tensionThreshold:Number = 100)
		{
			this.stiffness = stiffness;
			this.tensionThreshold = tensionThreshold;
		}
		
		/**
		 * This function must be assigned to the <code>ParticleSeed.reaction</code> parameter.
		 *  
		 * @param p1 The particle being compared to p2.
		 * @param p2 The particle being compared to p1.
		 */		
		public function reaction(p1:Particle, p2:Particle):void
		{
			var dx:Number = p2.position.x - p1.position.x;
			var dy:Number = p2.position.y - p1.position.y;
			var dz:Number = p2.position.z - p1.position.z;
			var dist:Number = Math.sqrt(dx * dx + dy * dy + dz * dz);
			if (dist < tensionThreshold)
			{
				var ax:Number = dx * stiffness;
				var ay:Number = dy * stiffness;
				var az:Number = dz * stiffness;
				p1.velocity.x += ax;
				p1.velocity.y += ay;
				p1.velocity.z += az;
				p2.velocity.x -= ax;
				p2.velocity.y -= ay;
				p2.velocity.z -= az;
			}
		}
		
	}
}