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
		
		private var keypressedLeft:Boolean;
		private var keypressedRight:Boolean;
		private var keypressedUp:Boolean;
		private var keypressedDown:Boolean;
		
		private var keypressed:Boolean
		
		public function Cam(color:uint,straal:Number, s:Stage) 
		{
			s.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			s.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			addEventListener(Event.ENTER_FRAME, update);
			
		}
		
		private function keyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.RIGHT || e.keyCode == Keyboard.D) {
				keypressedRight = false;
			}else if (e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.A) {
				keypressedLeft = false;
			}else if (e.keyCode == Keyboard.UP || e.keyCode == Keyboard.W) {
				keypressedUp = false;
			}else if (e.keyCode == Keyboard.DOWN || e.keyCode == Keyboard.S) {
				keypressedDown = false;
			}
		}
		
		private function keyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.RIGHT || e.keyCode == Keyboard.D) {
				keypressedRight = true;
			}else if (e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.A) {
				keypressedLeft = true;
			}else if (e.keyCode == Keyboard.UP || e.keyCode == Keyboard.W) {
				keypressedUp = true;
			}else if (e.keyCode == Keyboard.DOWN || e.keyCode == Keyboard.S) {
				keypressedDown = true;
			}
		}
		
		private function update(e:Event):void 
		{
			this.x += speedX;
			this.y += speedY;
			
			if (keypressedLeft && !keypressed) {
				keypressed = true;
				speedX = -speed;
			} else if (keypressedRight && !keypressed) {
				keypressed = true;
				speedX = speed;
			} else if (keypressedUp && !keypressed) {
				keypressed = true;
				speedY = -speed;
			} else if (keypressedDown && !keypressed) {
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