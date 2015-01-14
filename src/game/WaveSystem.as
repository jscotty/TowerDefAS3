package game
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class WaveSystem extends Sprite 
	{
		private var count:int = 0;
		private var time:int = 0;
		private var wave:int = 1;
		
		public function WaveSystem() 
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			count += 1;
			
			if (count >= 24) {
				time += 1;
				count = 0;
			}
		}
		
	}

}