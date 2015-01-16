package game.enemy.enemyType 
{
	import game.enemy.Enemy;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class WeakEnemy extends Enemy
	{
		private var enemy:Enemy1;
		
		public function WeakEnemy() 
		{
			enemy = new Enemy1();
			addChild(enemy);
			enemy.width = 32;
			enemy.height = 32;
			
			health = 100;
			speed = 6;
			scaleFactor = 0.001;
			points = 50;
		}
		
	}

}