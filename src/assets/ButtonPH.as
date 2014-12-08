package assets 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class ButtonPH extends Sprite
	{
		private var text:TextField;
		private var tf:TextFormat = new TextFormat("arial", 60, 0x000000, true);
		private var outline:GlowFilter = new GlowFilter(0xf0ff03, 1, 5, 5, 2, 1, false);
		public function ButtonPH() 
		{
			/*graphics.beginFill(0x00ff00, 1);
			graphics.drawRect(0, -5, 150, 100);
			graphics.endFill();*/
			
			text = new TextField();
			text.text = "Play";
			text.setTextFormat(tf);
			addChild(text);
			text.selectable = false;
			text.width = text.textWidth + 50;
			text.filters = [outline];
			
			text.addEventListener(MouseEvent.MOUSE_OVER, onHoover);
			text.addEventListener(MouseEvent.MOUSE_OUT, onOut);
		}
		
		private function onOut(e:MouseEvent):void 
		{
			this.alpha = 1;
		}
		
		private function onHoover(e:MouseEvent):void 
		{
			this.alpha = 0.8;
		}
		
	}

}