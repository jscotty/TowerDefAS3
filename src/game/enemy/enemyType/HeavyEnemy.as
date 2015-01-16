package game.enemy.enemyType 
{
	import game.enemy.Enemy;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class HeavyEnemy extends Enemy 
	{
		
		private var enemy:Enemy5;
		
		public function HeavyEnemy() 
		{
			enemy = new Enemy5;
			addChild(enemy);
			enemy.width = 32;
			enemy.height = 32;
			
			health = 100;
			speed = 3.2;
		}
		
	}

}