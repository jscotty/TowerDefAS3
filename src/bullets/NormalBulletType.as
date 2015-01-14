package bullets 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class NormalBulletType extends Sprite 
	{
		
		public function NormalBulletType() 
		{
			var bullet:BulletNormal = new BulletNormal();
			addChild(bullet);
			
		}
		
	}

}