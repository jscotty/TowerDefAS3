package bullets 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class WeakBulletType extends Sprite 
	{
		
		public function WeakBulletType() 
		{
			var bullet:BulletWeak = new BulletWeak();
			addChild(bullet);
			
		}
		
	}

}