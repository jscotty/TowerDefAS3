package com.blueflamedev.effects.reactions
{
	import com.blueflamedev.effects.Particle;
	
	import flash.display.DisplayObjectContainer;

	public class SortDepths implements IReaction
	{
		public var container:DisplayObjectContainer;
		
		public function SortDepths(particleContainer:DisplayObjectContainer)
		{
			container = particleContainer;
		}

		public function reaction(p1:Particle, p2:Particle):void
		{
			if (!p1.parent || !p2.parent)
				return;
				
			if (p1.position.z < p2.position.z)
			{
				checkForSwap(p1, p2);
			} else if (p1.position.z > p2.position.z)
			{
				checkForSwap(p2, p1);
			}
		}
		
		private function checkForSwap(closer:Particle, farther:Particle):void
		{
			if (container.getChildIndex(farther) > container.getChildIndex(closer))
			{
				container.swapChildren(closer, farther);
			}
		}
		
	}
}