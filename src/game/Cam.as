package game 
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Cam extends Sprite
	{
		public var color:uint;
		public var straal:Number;
		public var dragable:Boolean;
		
		private var speedX:Number;
		private var speedY:Number;
		private var speed:Number = 25;
		private var slowSpeed:Number = 10;
		
		private var left:Boolean;
		private var right:Boolean;
		private var up:Boolean;
		private var down:Boolean;
		
		private var keypressed:Boolean
		private var pauseButton:PauseButton;
		
		private var hand:Boolean;
		
		public function Cam(color:uint,straal:Number, s:Stage) 
		{
			s.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			s.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			s.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			s.addEventListener(MouseEvent.MOUSE_UP, onUp);
			addEventListener(Event.ENTER_FRAME, update);
			
		}
		
		private function onUp(e:MouseEvent):void 
		{
				right = false;
				left = false;
				down = false;
				up = false;
			
		}
		
		private function onDown(e:MouseEvent):void 
		{
			if(Game.paused == false){
				if (mouseY > 420) {
					down = true;
				}else if (mouseX > 675) {
					right = true;
				}else if (mouseX < 125) {
					left = true;
				}else if (mouseY < 100) {
					up = true;
				}
				if (e.target == Game.pauseButton) {
					right = false;
					left = false;
					down = false;
					up = false;
					
					Game.paused = true;
				}
				for (var i:int = 0; i < Shop.btnArray.length; i++) {
					if (e.target == Shop.btnArray[i]) {
						right = false;
						left = false;
						down = false;
						up = false;
					}
				}
			}else {
				if (e.target == Game.pauseButton) {
					right = false;
					left = false;
					down = false;
					up = false;
					
					Game.paused = false;
				}
			}
			
		}
		
		private function keyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.RIGHT || e.keyCode == Keyboard.D) {
				right = false;
			}else if (e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.A) {
				left = false;
			}else if (e.keyCode == Keyboard.UP || e.keyCode == Keyboard.W) {
				up = false;
			}else if (e.keyCode == Keyboard.DOWN || e.keyCode == Keyboard.S) {
				down = false;
			}
		}
		
		private function keyDown(e:KeyboardEvent):void 
		{
			if(Game.paused == false){
				if (e.keyCode == Keyboard.RIGHT || e.keyCode == Keyboard.D) {
					right = true;
				}else if (e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.A) {
					left = true;
				}else if (e.keyCode == Keyboard.UP || e.keyCode == Keyboard.W) {
					up = true;
				}else if (e.keyCode == Keyboard.DOWN || e.keyCode == Keyboard.S) {
					down = true;
				}
			}
		}
		
		private function update(e:Event):void 
		{
			if (Game.paused == false) {
				this.x += speedX;
				this.y += speedY;
				
				
				if (left && !keypressed) {
					keypressed = true;
					speedX = -speed;
				} else if (right && !keypressed) {
					keypressed = true;
					speedX = speed;
				} else if (up && !keypressed) {
					keypressed = true;
					speedY = -speed;
				} else if (down && !keypressed) {
					keypressed = true;
					speedY = speed;
				} else if (speedX > 0) {
					speedX -= slowSpeed;
					keypressed = false;
					if (speedX <= 0) {
						speedX = 0;
					}
				} else if (speedY > 0) {
					speedY -= slowSpeed;
					keypressed = false;
					if (speedY <= 0) {
						speedY = 0;
					}
				} else if (speedY < 0) {
					speedY += slowSpeed;
					keypressed = false;
				} else if (speedX < 0) {
					speedX += slowSpeed;
					keypressed = false;
				}
				if (this.x <= -235) {
					keypressed = true;
					this.x += 10;
				}else if (this.x >= 2275) {
					keypressed = true;
					this.x -= 10;
				}else if (this.y <= -1) {
					keypressed = true;
					this.y += 10;
				}else if (this.y >= 1065) {
					keypressed = true;
					this.y -= 10;
				}else {
					keypressed = false;
				}
					
					if (mouseY > 420) {
						MouseC.mouseInt = 4;
					}else if (mouseX > 675) {
						MouseC.mouseInt = 2;
					}else if (mouseX < 125) {
						 MouseC.mouseInt = 3;
					} else if (mouseY < 100) {
						MouseC.mouseInt = 5;
					}else {
						MouseC.mouseInt = 0;
					}
			}else {
				MouseC.mouseInt = 0;
			}
		}
		
		
	}

}