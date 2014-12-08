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
		
		private var speed:Number = 15;
		
		public function Cam(color:uint,straal:Number, s:Stage) 
		{
			s.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			addEventListener(Event.ENTER_FRAME, update);
			
		}
		
		private function keyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.RIGHT) {
				
			}else if (e.keyCode == Keyboard.LEFT) {
				
			}else if (e.keyCode == Keyboard.UP) {
				
			}else if (e.keyCode == Keyboard.DOWN) {
				
			}
		}
		
		private function update(e:Event):void 
		{
			
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