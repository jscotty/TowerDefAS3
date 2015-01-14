package com.blueflamedev.effects.reactions
{
	import com.blueflamedev.effects.Particle;
	import com.blueflamedev.events.ParticleEvent;
	
	import flash.events.EventDispatcher;
	
	/**
	 * A gravitate reaction applies gravity and mass to each particle.
	 * The same mass (speficied in <code>Gravitate.mass</code>) is applied to each particle unless a value is given to <code>Particle.mass</mass> 
	 * 
	 * @author Eric Smith
	 * 
	 */	
	public class Gravitate extends EventDispatcher implements IReaction
	{
		/**
		 * The strength that this particle pulls other particles in at. 
		 */		
		public var mass:Number;
		
		/**
		 * The distance (in pixels) that a particle must be from another particle in order for them to be considered "colliding".
		 */		
		public var collisionThreshold:Number;
		
		public function Gravitate(mass:Number = 10, collisionThreshold:Number = 5):void
		{
			this.mass = mass;
			this.collisionThreshold = collisionThreshold;
		}
		
		/**
		 * This function must be assigned to the <code>ParticleSeed.reaction</code> parameter.
		 *  
		 * @param p1 The particle being compared to p2.
		 * @param p2 The particle being compared to p1.
		 */	
		public function reaction(p1:Particle, p2:Particle):void
		{
			if (!p1.mass)
				p1.mass = mass;
			if (!p2.mass)
				p2.mass = mass;
				
			var dx:Number = p2.position.x - p1.position.x;
			var dy:Number = p2.position.y - p1.position.y;
			var dz:Number = p2.position.z - p1.position.z;
			var distSQ:Number = dx * dx + dy * dy + dz * dz;
			var dist:Number = Math.sqrt(distSQ);
			if (dist < collisionThreshold)
			{
				dispatchEvent(new ParticleEvent(ParticleEvent.COLLIDE, p1));
				dispatchEvent(new ParticleEvent(ParticleEvent.COLLIDE, p2));
				return;
			}
			var force:Number = p1.mass * p2.mass / distSQ;
			var ax:Number = force * dx / dist;
			var ay:Number = force * dy / dist;
			var az:Number = force * dz / dist;
			p1.velocity.x += ax / p1.mass;
			p1.velocity.y += ay / p1.mass;
			p1.velocity.z += az / p1.mass;
			p2.velocity.x -= ax / p2.mass;
			p2.velocity.y -= ay / p2.mass;
			p2.velocity.z -= az / p2.mass;
		}
	}
}