package game.bullets 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.Game;
	import game.tower.Tower;
	import utils.Vector2D;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class WeakBullet extends Sprite
	{
		private var bulletType:BulletWeak;
		private var velocity:Vector2D;
		public var bulletHit:String = "bulletHit";
		public var type:String = "weak";
		public var enemyNum:int;
		private var count:int = 0;
		public function WeakBullet() 
		{
			bulletType = new BulletWeak();
			addChild(bulletType);
			
			velocity = new Vector2D(Tower.dif.x, Tower.dif.y);
			velocity.length = 35;
			
			this.rotation = (velocity.angle * 180 / Math.PI);
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
				this.y += velocity.y;
				this.x += velocity.x;
				
				var enemy:Array = Game.enemyArray;
				for (var i:int = 0; i < enemy.length; i++) {
					if (this.hitTestObject(enemy[i])) {
						count ++;
						if (count == 1) {
							enemyNum = i;
							enemy[i].particle = true;
							enemy[i].bullet = type;
							enemy[i].enemyId = i;
							dispatchEvent(new Event(bulletHit));
						}
					}else {
						count = 0;
					}
				}
		}
		
	}

}