package com.blueflamedev.effects
{
	import com.blueflamedev.effects.particles.WhiteParticle;
	import com.blueflamedev.events.ParticleEvent;
	import com.blueflamedev.math.Vector3D;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	
	/**
	 * A 3D or 2D particle simulation class.
	 * 
	 * @example Barebones implementation on a Flash timeline:
	 * <listing version="3.0">
	 * import com.blueflamedev.effects.ParticleSeed;
	 * 
	 * var particleSeed:ParticleSeed = new ParticleSeed(this);
	 * particleSeed.duration = 2000; //example parameter
	 * addChild(particleSeed);
	 * 
	 * //start the particle generator
	 * particleSeed.start();
	 * </listing> 
	 * 
	 * <p><b>TO DO:</b>
	 * <ul>
	 * <li>Depth sorting. Is it worth the overhead?</li>
	 * </ul></p> 
	 * 
	 * @author Eric Smith
	 * 
	 */
	public class ParticleSeed extends Sprite
	{
		/**
		 * How long (in ms) the particles last before fading out 
		 */		
		public var duration:Number;
		
		/**
		 * Place gravity and wind forces in this object. This force is applied to the particle at the particle's creation. 
		 */		
		public var force:Vector3D;
		
		/**
		 * How many particles are released per interval. If this is raised above one, the <code>releaseInterval</code> should be raised. 
		 */		
		public var releaseAmount:int;
		
		/**
		 * The minimum trajectory (in pixels) that a particle will shoot.
		 */		
		public var minimumMagnitude:Number;
		
		/**
		 * The maximum trajectory (in pixels) that a particle will shoot.
		 */		
		public var maximumMagnitude:Number;
		
		/**
		 * The friction in the air. Set between 0 and 1.
		 * A value of 0 will put not allow the particles to move (maximum friction).
		 * A value of 1 will never allow them to slow down.
		 */		
		public var damping:Number;
		
		/**
		 * A reference to the class used to create the particle views. This may contain logic for visually manipulating
		 * itself or performing other logic.
		 */	
		public var particle:Class;
		
		/**
		 * When gravity is being used (AKA particle mass is above 0),
		 * this value keeps particles from launching too quickly when they should collide.
		 * When a particle's distance is below this threshold, their gravitation is not taken into account.
		 */		
		public var gravitationThreshold:Number;
		
		/**
		 * @private
		 */		
		private var _bounds:Rectangle;
		
		/**
		 * @ private 
		 * The container in which the particles will be added to. The stage is always a good place for this.
		 */		
		private var _container:Sprite;
		
		/**
		 * @private 
		 */	
		private var _releaseTimer:Timer;
		
		/**
		 * @private 
		 */	
		private var _releaseInterval:Number;
		
		/**
		 * @private 
		 */	
		private var _minimumAngleX:Number;
		
		/**
		 * @private 
		 */	
		private var _maximumAngleX:Number;
		
		/**
		 * @private 
		 */	
		private var _minimumAngleY:Number;
		
		/**
		 * @private 
		 */	
		private var _maximumAngleY:Number;
		
		/**
		 * @private 
		 */	
		private var _minimumAngleq:Number;
		
		/**
		 * @private 
		 */	
		private var _maximumAngleq:Number;
		
		/**
		 * @private 
		 */			
		private var _q:Number;
		
		/**
		 * @private 
		 */			
		private var _running:Boolean;
		
		/**
		 * @private 
		 */		
		private var _positionParticle:Function;
		
		/**
		 * @private 
		 */
		private var _reaction:Function;
		
		/**
		 * @private 
		 */		
		private var _particles:Array;
		
		/**
		 * @private 
		 */		
		private var _reactions:Array;
		
		/**
		 * The constructor.
		 *  
		 * @param container The container in which the particles will be added to. This is different from
		 * the container that the <code>ParticleSeed</code> is added to (using addChild()).
		 * The reason for this is so the seed's position can change without moving all of the particles.
		 * 
		 */		
		public function ParticleSeed(container:Sprite, params:Object = null)
		{
			_container = container;
			resetValues();
			_particles = new Array();
			_reactions = new Array();
			
			//set params from constructor
			for (var param:String in params)
				this[param] = params[param];
		}
		
		public function resetValues():void
		{
			q 					= 0;
			duration 			= 4000;
			force 				= new Vector3D(0, 0.2, 0);
			particle 			= WhiteParticle;
			gravitationThreshold= 5;
			releaseInterval 	= 50;
			releaseAmount 		= 1;
			damping 			= .9;
			setMagnitude(0, 10);
			setAngleX(0, 360);
			setAngleY(0, 360);
			setAngleq(0, 360);
		}
		
		/**
		 * How often new particles get released (in ms). Use in conjuntion with <code>releaseAmount</code> 
		 */		
		public function get releaseInterval():Number
		{
			return _releaseInterval;
		}
		
		public function set releaseInterval(value:Number):void
		{
			_releaseInterval = value;
			if (_running)
				start();
		}
		
		/**
		 * If specified, particles are emitted at random x and y locations from within the rectangle bounds, relative to the particle container.
		 * To make particles emit from the <code>ParticleSeed</code>'s x and y point, assign <code>bounds</code> to <code>null</code>.
		 */		
		public function get bounds():Rectangle
		{
			return _bounds;
		}
		
		public function set bounds(value:Rectangle):void
		{
			_bounds = value;
			
			if (_running)
				start();
		}
		
		/**
		 * The minimum-allowable value in a random initial trajectory along the x-axis. Value is in degrees.
		 */		
		public function get minimumAngleX():Number
		{
			return _minimumAngleX * 180 / Math.PI;
		}
		
		public function set minimumAngleX(value:Number):void
		{
			_minimumAngleX = value * Math.PI / 180;
		}
		
		/**
		 * The maximum-allowable value in a random initial trajectory along the x-axis. Value is in degrees.
		 */	
		public function get maximumAngleX():Number
		{
			return _maximumAngleX * 180 / Math.PI;
		}
		
		public function set maximumAngleX(value:Number):void
		{
			_maximumAngleX = value * Math.PI / 180;
		}
		
		/**
		 * The minimum-allowable value in a random initial trajectory along the y-axis. Value is in degrees.
		 */	
		public function get minimumAngleY():Number
		{
			return _minimumAngleY * 180 / Math.PI;
		}
		
		public function set minimumAngleY(value:Number):void
		{
			_minimumAngleY = value * Math.PI / 180;
		}
		
		/**
		 * The maximum-allowable value in a random initial trajectory along the y-axis. Value is in degrees.
		 */	
		public function get maximumAngleY():Number
		{
			return _maximumAngleY * 180 / Math.PI;
		}
		
		public function set maximumAngleY(value:Number):void
		{
			_maximumAngleY = value * Math.PI / 180;
		}
		
		/**
		 * The minimum-allowable value in a random initial trajectory along the q-axis. Value is in degrees.
		 */	
		public function get minimumAngleq():Number
		{
			return _minimumAngleq * 180 / Math.PI;
		}
		
		public function set minimumAngleq(value:Number):void
		{
			_minimumAngleq = value * Math.PI / 180;
		}
		
		/**
		 * The maximum-allowable value in a random initial trajectory along the q-axis. Value is in degrees.
		 */	
		public function get maximumAngleq():Number
		{
			return _maximumAngleq * 180 / Math.PI;
		}
		
		public function set maximumAngleq(value:Number):void
		{
			_maximumAngleq = value * Math.PI / 180;
		}
		
		/**
		 * The starting q position of the particle seed.
		 */	
		
		/**
		 * @returns an array of all the active particles.
		 */		
		public function get particles():Array
		{
			return _particles;
		}
		
		public function get q():Number 
		{
			return _q;
		}
		
		public function set q(q:Number):void 
		{
			_q = q;
		}
		
		/**
		 * A reaction is a function that gets called every frame to compare every particle to every other particle.
		 * For instance, when doing q depth swapping (to make closer objects overlap farther objects), every particle depth
		 * must be compared with every other depth.
		 * 
		 * <p>A reaction function takes two parameters of type <code>Particle</code>, which are the particles being compared.
		 * You can use ParticleSun's premade reactions or create your own reaction function (see examples below).</p>
		 * 
		 * @example You can implement a reaction function like this, which implements the premade Gravitation reaction:
		 * <listing version="3.0">
		 * //create a Gravitation instance from com.blueflamedev.effects.reactions
		 * var gravitate:Function = new Gravitation().reaction;
		 * particleSeed.addReaction(gravitate);
		 * </listing> 
		 * 
		 * @example You can create a custom reaction function like this:
		 * <listing version="3.0">
		 * particleSeed.addReaction(myReaction);
		 * private function myReaction(p1:Particle, p2:Particle):void
		 * {
		 * 		//do something with p1 and p2
		 * }
		 * </listing> 
		 */		
		public function addReaction(reaction:Function):void
		{
			if (_reactions.indexOf(reaction) != -1)
				throw new Error("The same reaction cannot be added twice.");
			
			_reactions.push(reaction);
			if (_reactions.length == 1)
			{
				addEventListener(Event.ENTER_FRAME, onEnterFrame);
			}
		}
		
		/**
		 * Removes a reaction that was added via <code>addReaction()</code>
		 *  
		 * @param reaction The reaction to be removed from processing.
		 * 
		 */		
		public function removeReaction(reaction:Function):void
		{
			_reactions.splice(_reactions.indexOf(reaction));
			
			if (_reactions.length == 0)
			{
				removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			}
		}
		
		/**
		 * Checks whether the particle seed has the reaction specified in the argument.
		 * 
		 * @param reaction The reaction to check for.
		 * @return True if the particle seed has the reaction. False if it doesn't.
		 */		
		public function hasReaction(reaction:Function):Boolean
		{
			if (_reactions.indexOf(reaction) != -1)
				return true;
			
			return false;
		}
		
		/**
		 * @Begins the seeding process.
		 */		
		public function start():void
		{
			stop();
			_releaseTimer = new Timer(_releaseInterval);
			_releaseTimer.addEventListener(TimerEvent.TIMER, onReleaseTimer);
			_releaseTimer.start();
			_running = true;
			if (_bounds)
				_positionParticle = positionByBounds;
			else
				_positionParticle = positionByPoint;
			releaseAllParticles();
		}
		
		/**
		 * @Stops the seed from producing particles.
		 */		
		public function stop():void
		{
			if (_releaseTimer)
			{
				if (_releaseTimer.running)
					_releaseTimer.stop();
				if (_releaseTimer.hasEventListener(TimerEvent.TIMER))
					_releaseTimer.removeEventListener(TimerEvent.TIMER, onReleaseTimer);
				_running = false;
			}
		}
		
		/**
		 * creates a <code>Particle</code> object and adds it into the particle system. <code>ParticleSeed.create()</code>
		 * is used for dynamically creating unique particles that are genearted from an event outside of particle release intervals.
		 *  
		 * @param particle
		 * 
		 */		
		public function create(particle:Particle):void
		{
			_particles.push(particle);
			dispatchEvent(new ParticleEvent(ParticleEvent.CREATE, particle));
			//event listeners
			particle.addEventListener(Event.COMPLETE, onParticleDurationComplete);
			//add it
			_container.addChild(particle);
		}
		
		/**
		 * Immediately destroys any particle in the particle system.
		 * 
		 * @param particle
		 */		
		public function destroy(particle:Particle):void
		{
			_particles.splice(_particles.indexOf(particle), 1);
			dispatchEvent(new ParticleEvent(ParticleEvent.DESTROY, particle));
			particle.removeEventListener(Event.COMPLETE, onParticleDurationComplete);
			
			if (_container.contains(particle))
				_container.removeChild(particle);
		}
		
		/**
		 * Defines low and high thresholds for a random initial trajectory along the x-axis. Output is in degrees.
		 * 
		 * @param minimumAngle An angle in degrees.
		 * @param maximumAngle An agnle in degrees.
		 */		
		public function setAngleX(minimumAngle:Number, maximumAngle:Number):void
		{
			_minimumAngleX = minimumAngle * Math.PI / 180;
			_maximumAngleX = maximumAngle * Math.PI / 180;
		}
		
		/**
		 * Defines low and high thresholds for a random initial trajectory along the y-axis. Output is in degrees.
		 * 
		 * @param minimumAngle An angle in degrees.
		 * @param maximumAngle An agnle in degrees.
		 */		
		public function setAngleY(minimumAngle:Number, maximumAngle:Number):void
		{
			_minimumAngleY = minimumAngle * Math.PI / 180;
			_maximumAngleY = maximumAngle * Math.PI / 180;
		}
		
		/**
		 * Defines low and high thresholds for a random initial trajectory along the q-axis. Output is in degrees.
		 * 
		 * @param minimumAngle An angle in degrees.
		 * @param maximumAngle An agnle in degrees.
		 */		
		public function setAngleq(minimumAngle:Number, maximumAngle:Number):void
		{
			_minimumAngleq = minimumAngle * Math.PI / 180;
			_maximumAngleq = maximumAngle * Math.PI / 180;
		}
		
		/**
		 * The power of the initial trajectory in pixels per frame.
		 * Setting the damping and force values will effect the particle's velocity after this initial trajectory.
		 * 
		 * @param minimum
		 * @param maximum
		 * 
		 */		
		public function setMagnitude(minimum:Number, maximum:Number):void
		{
			minimumMagnitude = minimum;
			maximumMagnitude = maximum;
		}
		
		/**
		 * @private
		 */		
		private function onReleaseTimer(event:Event):void
		{
			releaseAllParticles();
		}
		
		/** 
		 * @private
		 */		
		private function releaseAllParticles():void
		{
			for (var i:int=0; i<releaseAmount; i++)
				releaseParticle();
		}
		
		/** 
		 * @private
		 */		
		private function positionByBounds(p:Particle):void
		{
			p.x = Math.random() * _bounds.width + _bounds.x;
			p.y = Math.random() * _bounds.height + _bounds.y; 
			p.position = new Vector3D(p.x, p.y, _q);
		}
		
		/** 
		 * @private
		 */		
		private function positionByPoint(p:Particle):void
		{
			p.x = x;
			p.y = y;
			p.position = new Vector3D(p.x, p.y, _q);
		}
		
		/**
		 * @private 
		 */		
		private function releaseParticle():void
		{
			//create particle
			var p:Particle = new Particle(duration, new particle(), damping, force);
			create(p);
			
			//setting the vector to (0, 0, 0) produces poor effects. Is this normal?
			p.velocity = new Vector3D(0, 0, 1);
			p.velocity.length = Math.random() * (maximumMagnitude - minimumMagnitude) + minimumMagnitude;
			p.velocity.rotateX(Math.random() * (_maximumAngleX - _minimumAngleX) + _minimumAngleX);
			p.velocity.rotateY(Math.random() * (_maximumAngleY - _minimumAngleY) + _minimumAngleY);
			p.velocity.rotateZ(Math.random() * (_maximumAngleq - _minimumAngleq) + _minimumAngleq);
			
			//position the particle
			_positionParticle(p);
		}
		
		/**
		 * @private 
		 */		
		private function onParticleDurationComplete(event:Event):void
		{
			var particle:Particle = event.target as Particle;
			destroy(particle);
		}
		
		/**
		 * @private
		 */		
		private function onEnterFrame(event:Event):void
		{
			var len:int = _particles.length;
			
			for (var i:int = 0; i < len; i++)
			{
				var p1:Particle = _particles[i];
				for (var j:int = i + 1; j < len; j++)
				{
					var p2:Particle = _particles[j];
					if (p1 && p2)
					{
						for each (var reaction:Function in _reactions)
						{
							reaction(p1, p2);
						}
					}
				}
			}
		}
		
	}
}