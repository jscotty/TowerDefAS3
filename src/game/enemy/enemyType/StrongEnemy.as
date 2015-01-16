package game.enemy.enemyType 
{
	import game.enemy.Enemy;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class StrongEnemy extends Enemy 
	{
		private var enemy:Enemy3;
		
		public function StrongEnemy() 
		{
			enemy = new Enemy3();
			addChild(enemy);
			enemy.width = 32;
			enemy.height = 32;
			
			health = 100;
			speed = 3.3;
			scaleFactor = 0.0001;
		}
		
	}

}