package game.enemy 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.Game;
	import game.Shop;
	import game.TileGrid;
	import game.grid.Grid;
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
		
		private var death:String = "enemyDeath";
		
		private var direction:Array = [[],[]];
		
		private var posX:Number = 30;
		private var posY:Number = 30;
		
		private var count:int = 1;
		private var deathcount:int = 0;
		public var died:Boolean = false;
		
		public function enemyBehaviour():void
		{
			addEventListener(Event.ENTER_FRAME, update);
			direction[0] = 1;
		}
		
		public function update(e:Event):void 
		{
			if(Game.paused == false){
				var indexX:Number = Math.floor((this.x - posX) / 64), indexY:Number = Math.floor((this.y - posY)/ 64);
				var tilegrid:Array = TileGrid.tileGrid;
				
				//dir 1 is X direction
				this.x += direction[0] * speed;
				
				//dir 2 is Y direction
				this.y += direction[1] * speed;
				if (indexY <= 1) {
					indexY = 1;
				}else {
					
				}
				//trace("indexX (", indexX,") indexY(",indexY,")");
					var myTile:Number = tilegrid[indexY][indexX];
					var nexTile:Number = tilegrid[indexY + direction[1]][indexX + direction[0]];
					var up:Number = tilegrid[indexY - 1][indexX];
					var down:Number = tilegrid[indexY + 1][indexX];
					var right:Number = tilegrid[indexY][indexX + 1];
					var left:Number = tilegrid[indexY][indexX - 1];
				
					
				
				//trace("mytile: " + myTile + " >NEXTILE<:" + nexTile + " up:" + up + " down:" + down + " right:" + right + " left:" + left);
				
				if (direction[0] == -1) posX = -30;
				if (direction[0] == 1) posX = 30;
				if (direction[1] == -1) posY = -30;
				if (direction[1] == 1) posY = 30;
				
				if (direction[0] == 1 && nexTile <= 0) {
					if ( right > 0) {
						direction[0] = 1;
						direction[1] = 0;
					}
					else if ( down > 0) {
						direction[0] = 0;
						direction[1] = 1;
					}
					else if ( up > 0) {
						direction[0] = 0;
						direction[1] = -1;
					}
					else if ( left > 0) {
						direction[0] = -1;
						direction[1] = 0;
					}
				} else if (direction[0] == -1 && nexTile <= 0) {
					if ( down > 0) {
						direction[0] = 0;
						direction[1] = 1;
					}
					else if ( up > 0) {
						direction[0] = 0;
						direction[1] = -1;
					}
					else if ( left > 0) {
						direction[0] = -1;
						direction[1] = 0;
					}
					else if ( right > 0) {
						direction[0] = 1;
						direction[1] = 0;
					}
				} else if (direction[1] == 1 && nexTile <= 0) {
					if ( right > 0) {
						direction[0] = 1;
						direction[1] = 0;
					}
					else if ( left > 0) {
						direction[0] = -1;
						direction[1] = 0;
					}
					else if ( up > 0) {
						direction[0] = 0;
						direction[1] = -1;
					}
					else if ( down > 0) {
						direction[0] = 0;
						direction[1] = 1;
					}
				} else if (direction[1] == -1 && nexTile <= 0) {
					if ( right > 0) {
						direction[0] = 1;
						direction[1] = 0;
					}
					else if ( left > 0) {
						direction[0] = -1;
						direction[1] = 0;
					}
					else if ( down > 0) {
						direction[0] = 0;
						direction[1] = 1;
					}
					else if ( up > 0) {
						direction[0] = 0;
						direction[1] = -1;
					}
				}
				
				if (myTile == 19) {
						direction[0] = direction[0];
						direction[1] = direction[1];
				} else if (myTile == 19) {
						direction[0] = direction[0];
						direction[1] = direction[1];
				} else if (myTile == 20) {
						direction[0] = direction[0];
						direction[1] = direction[1];
				} else if (myTile == 21) {
						direction[0] = direction[0];
						direction[1] = direction[1];
					} else if (myTile == 26) {
						if (direction[0] == 1) {
							direction[0] = 0;
							direction[1] = 1;
						} else if (direction[1] == -1) {
							direction[0] = -1;
							direction[1] = 0;
						}
					} else if (myTile == 27) {
						if (direction[0] == -1) {
							direction[0] = 0;
							direction[1] = -1;
						} else if (direction[1] == 1) {
							direction[0] = 1;
							direction[1] = 0;
						}
					} else if (myTile == 28) {
						if (direction[0] == 1) {
							direction[0] = 0;
							direction[1] = -1;
						} else if (direction[1] == 1) {
							direction[0] = -1;
							direction[1] = 0;
						}
					}else if (myTile == 29) {
						if (direction[0] == -1) {
							direction[0] = 0;
							direction[1] = 1;
						} else if (direction[1] == -1) {
							direction[0] = 1;
							direction[1] = 0;
						}
				} else if (myTile == 99) {
					direction[0] = 0;
					direction[1] = 0;
					
					this.scaleX -= 0.05;
					this.scaleY -= 0.05;
					
					health -= 100;
				}
				if (this.scaleX <= 0.01) {
					this.scaleX = 0;
					this.scaleY = 0;
				}
				
				if (health <= 0) {
					scaleX -= 0.1;
					scaleY -= 0.1;
					
					count ++;
					//trace(count);
					if (count >= 10) {
						died = true;
						removeEventListener(Event.ENTER_FRAME, update);
						dispatchEvent(new Event(death));
					}
				}
			} else {
				
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