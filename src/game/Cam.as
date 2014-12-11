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
			if (mouseX > stage.stageWidth / 1.2) {
				right = true;
			}else if (mouseX < stage.stageWidth / 5) {
				left = true;
			}else if (mouseY > stage.stageHeight / 1.2) {
				down = true;
			}else if (mouseY < stage.stageHeight / 5) {
				up = true;
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
		
		private function update(e:Event):void 
		{
			this.x += speedX;
			this.y += speedY;
			
			trace("MouseX:" + mouseX + " stageWidth:" + stage.stageWidth / 6);
			
			if (mouseX > stage.stageWidth / 1.4) {
				trace("move");
			}
			
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
				if (speedX < 0.5) {
					speedX = 0;
				}
			} else if (speedY > 0) {
				speedY -= slowSpeed;
				keypressed = false;
				if (speedY < 0.5) {
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
		}
		
		public function redraw(reColor:int):void
		{
			var g:Graphics = this.graphics;
			this.color = reColor;
			this.straal = straal;
			g.lineStyle(2);
			g.beginFill(color);
			g.drawCircle(0, 0, straal);
			g.endFill();
		}
		
		
	}

}