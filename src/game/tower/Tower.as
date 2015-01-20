package game.tower
{
	import com.blueflamedev.effects.Particle;
	import flash.display.Sprite;
	import flash.events.Event;
	import game.bullets.HeavyBullet;
	import game.bullets.NormalBullet;
	import game.bullets.StrongBullet;
	import game.bullets.WeakBullet;
	import game.Game;
	import game.ParticleSystem;
	import game.TileGrid;
	import game.grid.Grid;
	import utils.Vector2D;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Tower extends Sprite
	{
		private var _damage:Number;
		private var _coolDown:Number;
		private var _bullet:String;
		private var _collision:int;
		private var spaceX:Number = 70;
		private var spaceY:Number = 70;
		
		public var iX:int;
		public var iY:int;
		
		public static var difX:Array = [];
		public static var difY:Array = [];
		public static var dif:Vector2D;
		
		private var enemy:Array;
		private var enemyNum:int;
		
		private var targetEnemy:Vector2D;
		
		public var diff:int;
		private var counter:int = 0;
		
		private var weak:String = "weak";
		private var normal:String = "normal";
		private var strong:String = "strong";
		private var heavy:String = "heavy";
		public var anim:Number;
		
		private var bloodbullet;
		private var bulletArray:Array = [];
		private var enemyHit:String = "enemyHit";
		
		private var particleSystem:ParticleSystem;
		private var particleArray:Array = [];
		private var enemyDeath:String = "enemyDeath";
		private var kill:int;
		
		public function towerBehaviour(iX:int, iY:int):void
		{
			this.iX = iX;
			this.iY = iY;
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			if (!Game.paused)
			{
				var grid:Array = TileGrid.tileGrid;
				enemy = Game.enemyArray;
				
				for (var i:int = 0; i < enemy.length; i++)
				{
					difX[i] = Math.floor(enemy[i].x - this.x);
					difY[i] = Math.floor(enemy[i].y - this.y);
					//trace("difX("+i+"):("+difX+") difY("+i+"):("+difY+")");
					
					dif = new Vector2D(difX[i], difY[i]);
					//trace(dif);
					
					diff = Math.floor(dif.length);
					//trace("dif: "+dif);
					if (diff < collision)
					{
						if (bullet == heavy) {
							this.rotation = dif.angle * 180 / Math.PI + 90;
						}
						counter++;
						anim = 0;
						//trace(counter);
						if (counter >= coolDown)
						{
							kill = i;
							shoot(bullet);
							counter = 0;
							anim = 1;
						}
					}
					else
					{
						//	this.rotation = 0;
					}
					
					
				}
			} else {
				
			}
		}
		
		private function shoot(bulletType:String):void
		{
			if (bulletType == weak)
			{
				bloodbullet = new WeakBullet;
				addChild(bloodbullet);
				bloodbullet.addEventListener(bloodbullet.bulletHit, hit);
				bulletArray.push(bloodbullet);
				bulletArray[0].alpha = 0;
			}
			else if (bulletType == normal)
			{
				bloodbullet = new NormalBullet;
				addChild(bloodbullet);
				bulletArray.push(bloodbullet);
			}
			else if (bulletType == strong)
			{
				bloodbullet = new StrongBullet;
				addChild(bloodbullet);
				bulletArray.push(bloodbullet);
			}
			else if (bulletType == heavy)
			{
				anim = 1;
				//trace("death");
				enemy[kill].died = 10;
				trace(enemy[kill].died);
				dispatchEvent(new Event(enemyDeath));
			}
			/*for (var i:int = 0; i < bulletArray.length; i++)
			{
				
			}
		*/
		
		}
		private function hit(e:Event):void 
		{
			for (var i:int = bulletArray.length -1; i > 0; i--) {
				enemyNum = bulletArray[i].enemyNum;
				removeChild(bulletArray[i]);
				bulletArray.splice(i, 1);
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
		
		public function get bullet():String
		{
			return _bullet;
		}
		
		public function set bullet(bullet:String):void
		{
			_bullet = bullet;
		}
		
		public function get collision():int 
		{
			return _collision;
		}
		
		public function set collision(collision:int):void 
		{
			_collision = collision;
		}
	
	}

}