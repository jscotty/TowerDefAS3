package game.enemy 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.Vector2D;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Enemy extends Sprite
	{
		private var _speed:Number;
		private var _health:Number;
		private var _mass:Number;
		

		
		public function enemyBehaviour():void
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			
		}
	
		public function get speed():Number 
		{
			return _speed;
		}
		
		public function set speed(speed:Number):void 
		{
			_speed = speed;
		}
		
		public function get health():Number 
		{
			return _health;
		}
		
		public function set health(health:Number):void 
		{
			_health = health;
		}
		
		public function get mass():Number 
		{
			return _mass;
		}
		
		public function set mass(mass:Number):void 
		{
			_mass = mass;
		}
	}

}