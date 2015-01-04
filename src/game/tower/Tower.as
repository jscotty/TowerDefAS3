package game.tower 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.Game;
	import game.TileGrid;
	import utils.Vector2D;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Tower extends Sprite
	{
		private var _damage:Number;
		private var _coolDown:Number;
		private var spaceX:Number = 70;
		private var spaceY:Number = 70;
		
		public var iX:int;
		public var iY:int;
		
		public var difX:Array = [];
		public var difY:Array = [];
		public var dif:Vector2D;
		
		private var enemy:Array;
		
		private var targetEnemy:Vector2D;
		
		public var diff:int;
		
		public function towerBehaviour(iX:int, iY:int):void 
		{
			this.iX = iX;
			this.iY = iY;
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			var grid:Array = TileGrid.tileGrid;
			enemy = Game.enemyArray;
			for (var i:int = 0; i < enemy.length; i++) {
				difX[i] = Math.floor(enemy[i].x - this.x);
				difY[i] = Math.floor(enemy[i].y - this.y);
				//trace("difX("+i+"):("+difX+") difY("+i+"):("+difY+")");
				
				dif = new Vector2D(difX[i], difY[i]);
					trace(dif);
				
				diff = Math.floor(dif.length);
				//trace(diff + "( " + i + " )");
				if (diff < 120) {
						this.rotation = dif.angle * 180 / Math.PI;
				}else {
					this.rotation = 0;
				}
				
				
			}
		}
		
		private function lookAt(target:int):void 
		{
			var targetdifX:int = enemy[target].x - this.x;
			var targetdifY:int = enemy[target].y - this.y;
			targetEnemy = new Vector2D(targetdifX, targetdifY);
				this.rotation = targetEnemy.angle * 180 / Math.PI;
			//trace(targetEnemy);
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