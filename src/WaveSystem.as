package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class WaveSystem extends Sprite 
	{
		private var time:int = 0;
		
		public function WaveSystem() 
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
	}

}