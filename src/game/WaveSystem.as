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
		public var time:int = 3;
		public var wave:int = 0;
		public var startWave:String = "wave";
		
		public function WaveSystem() 
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			var enemy:Array = Game.enemyArray;
			//trace(enemy.length);
			if (enemy.length <= 4) {
				count ++;
				if (count >= 24) {
					time --;
					count = 0;
					//trace(time);
				}
				if (time <= 0) {
					time = 16;
					wave ++;
					dispatchEvent(new Event(startWave));
				}
			}
		}
		
	}

}