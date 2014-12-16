package game 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class MouseC extends Sprite
	{
		private var cursor:MouseCursorNormal;
		private var cursorHand:MouseCursHand;
		private var cursorMove:MouseCursorMove;
		
		public static var mouseInt:int = 0;
		
		public function MouseC() 
		{
			cursor = new MouseCursorNormal();
			addChild(cursor);
			cursor.visible = true;
			cursor.mouseEnabled = false;
			
			cursorHand = new MouseCursHand();
			addChild(cursorHand);
			cursorHand.visible = false;
			cursorHand.mouseEnabled = false;
			
			cursorMove = new MouseCursorMove();
			addChild(cursorMove);
			cursorMove.visible = false;
			cursorMove.mouseEnabled = false;
			
			addEventListener(Event.ENTER_FRAME, mouseBehaviour);
		}
		
		private function mouseBehaviour(e:Event):void 
		{
			if (mouseInt == 0) { // normal
				cursor.visible = true;
				cursorHand.visible = false;
				cursorMove.visible = false;
			} else if (mouseInt == 1) { // hand
				cursor.visible = false;
				cursorHand.visible = true;
				cursorMove.visible = false;
			} else if (mouseInt == 2) { // move >
				cursor.visible = false;
				cursorHand.visible = false;
				cursorMove.visible = true;
				
				cursorMove.scaleX = 1;
				cursorMove.scaleY = 1;
				cursorMove.rotation = 0;
			} else if (mouseInt == 3) { // move <
				cursor.visible = false;
				cursorHand.visible = false;
				cursorMove.visible = true;
				
				cursorMove.scaleX = -1;
				cursorMove.scaleY = 1;
				cursorMove.rotation = 0;
			} else if (mouseInt == 4) { // move v
				cursor.visible = false;
				cursorHand.visible = false;
				cursorMove.visible = true;
				
				cursorMove.scaleX = 1;
				cursorMove.scaleY = 1;
				cursorMove.rotation = 90;
			} else if (mouseInt == 5) { // move ^
				cursor.visible = false;
				cursorHand.visible = false;
				cursorMove.visible = true;
				
				cursorMove.scaleX = 1;
				cursorMove.scaleY = 1;
				cursorMove.rotation = 270;
			}
		}
		
	}

}