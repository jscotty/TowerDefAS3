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
		}
		
	}

}