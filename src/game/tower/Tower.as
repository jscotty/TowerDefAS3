package game.tower 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Tower extends Sprite
	{
		private var _damage:Number;
		private var _coolDown:Number;
		
		public function towerBehaviour():void 
		{
			
		}
		
		public function get damage():Number 
		{
			return _damage;
		}
		
		public function set damage(damage:Number):void 
		{
			_damage = damage;
		}
		
		public function get coolDown():Number 
		{
			return _coolDown;
		}
		
		public function set coolDown(coolDown:Number):void 
		{
			_coolDown = coolDown;
		}
		
	}

}