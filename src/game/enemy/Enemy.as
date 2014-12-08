package game.enemy 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.TileGrid;
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
		
		private var direction:Array = [[],[]];
		

		
		public function enemyBehaviour():void
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			
			var indexX:Number = Math.floor((this.x - 30) / 64), indexY:Number = Math.floor((this.y - 30)/ 64);
			var tilegrid:Array = TileGrid.tileGrid;
			
			
			//dir 1 is X direction
			this.x += direction[0] * speed;
			
			//dir 2 is Y direction
			this.y += direction[1] * speed;
			
			
			trace(tilegrid[indexY][indexX]);
			if (tilegrid[indexY][indexX] == 0) {
				direction[0] = 1;
				direction[1] = 0;
			} else if (tilegrid[indexY][indexX] == 3) {
				direction[0] = 0;
				direction[1] = 1;
			} else if (tilegrid[indexY][indexX] == 4) {
				direction[0] = 1;
				direction[1] = 0;
			} else if (tilegrid[indexY][indexX] == 5) {
				direction[0] = 0;
				direction[1] = -1;
			} else if (tilegrid[indexY + 1][indexX] == 6) {
				direction[0] = 1;
				direction[1] = 0;
			}
			
			
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