package com.blueflamedev.events
{
	import com.blueflamedev.effects.Particle;
	
	import flash.events.Event;

	public class ParticleEvent extends Event
	{
		public static const CREATE:String 	= "create";
		public static const FADE:String 	= "fade";
		public static const DESTROY:String 	= "destroy";
		public static const COLLIDE:String	= "collide";
		
		private var _particle:Particle;
		
		public function ParticleEvent(type:String, particle:Particle, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_particle = particle;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ParticleEvent(type, particle, bubbles, cancelable);
		}
		
		public function get particle():Particle
		{
			return _particle;
		}
	}
}