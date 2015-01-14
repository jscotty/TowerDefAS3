package com.blueflamedev.effects
{
	import com.blueflamedev.math.Vector;
	import com.blueflamedev.math.Vector3D;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * The <code>Particle</code> class holds properties of a particle used in ParticleSun.
	 * The view and animation information are stored here and iterated ever frame.
	 * 
	 * @author Eric Smith
	 * 
	 */
	public dynamic class Particle extends Sprite
	{
		/**
		 * The particle's position in a 3D grid.
		 */		
		public var position:Vector3D;
		
		/**
		 * The particle's velocity to be added to its position.
		 */		
		public var velocity:Vector3D;
		
		/**
		 * The friction in the air. Set between 0 and 1.
		 * A value of 0 will put not allow the particles to move (maximum friction).
		 * A value of 1 will never allow them to slow down.
		 */		
		public var damping:Number;
		
		/**
		 * A force that is applied to the object every frame. Useful for wind and gravity. 
		 */		
		public var force:Vector3D;
		
		/**
		 * @private 
		 */		
		private var _skin:DisplayObject
		
		/**
		 * Creates a new particle.
		 *  
		 * @param duration The length of time before the particle fades away and disappears. Use -1 for an infinite duration.
		 * @param skin A display object to provide the look of the particle
		 * @param damping Causes damping in the air. Usually a number between 0 and 1.
		 * If you're unfamiliar with what this does, leave it at the default.
		 * @param force Applies a three-dimensional force to the object every frame.
		 * 
		 */			
		public function Particle(duration:Number, skin:DisplayObject, damping:Number = .9, force:Vector3D = null)
		{
			position = new Vector3D();
			velocity = new Vector3D();
			_skin = skin;
			this.damping = damping;
			if (force == null)
				force = new Vector3D(0, 0, 0);
			this.force = force;
			
			if (duration != -1)
			{
				var fadeTimer:Timer = new Timer(duration, 1);
				fadeTimer.addEventListener(TimerEvent.TIMER, onFadeTimer);
				fadeTimer.start();
			}
			addChild(_skin);
			addEventListener(Event.ENTER_FRAME, move);
			
			visible = false;
		}
		
		/**
		 * The display object that renders as the visible particle.
		 */		
		public function get skin():DisplayObject
		{
			return _skin;
		}
		
		public function set skin(value:DisplayObject):void
		{
			if (contains(_skin))
				removeChild(_skin);
			
			_skin = value;
			addChild(_skin);
		}
		
		/** 
		 * @private
		 */		
		private function move(event:Event):void
		{
			//adjust velocity
			velocity.scaleEquals(damping);
			velocity.plusEquals(force);
			//adjust position
			position.plusEquals(velocity);
			//adjust scale
			var perspective:Number = position.getPerspective();
			var pos:Vector3D = position.project(perspective);
			scaleX = scaleY = perspective;
			x = pos.x;
			y = pos.y;
			visible = true;
		}
		
		/**
		 * @private
		 */		
		private function onFadeTimer(event:TimerEvent):void
		{
			addEventListener(Event.ENTER_FRAME, fadeOut);
			event.target.removeEventListener(TimerEvent.TIMER, onFadeTimer);
		}
		
		/**
		 * @private
		 */		
		private function fadeOut(event:Event):void
		{
			alpha -= .1;
			
			if (alpha <= 0)
			{
				dispatchEvent(new Event(Event.COMPLETE));
				removeEventListener(Event.ENTER_FRAME, fadeOut);
				removeEventListener(Event.ENTER_FRAME, move);
			}
		}
	}
}