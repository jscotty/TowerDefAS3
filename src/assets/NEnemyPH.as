package assets 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class NEnemyPH extends Sprite
	{
		
		public function NEnemyPH() 
		{
			graphics.beginFill(0xff0000, 1);
			graphics.drawCircle(0, -5, 15);
			graphics.endFill();
		}
		
	}

}