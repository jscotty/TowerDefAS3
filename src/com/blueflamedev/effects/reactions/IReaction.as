package com.blueflamedev.effects.reactions
{
	import com.blueflamedev.effects.Particle;
	
	public interface IReaction
	{
		function reaction(p1:Particle, p2:Particle):void
	}
}