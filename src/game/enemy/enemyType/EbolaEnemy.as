package game.enemy.enemyType 
{
	import game.enemy.Enemy;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EbolaEnemy extends Enemy
	{
		private var enemy:Enemy4;
		
		public function EbolaEnemy() 
		{
			enemy = new Enemy4();
		}
		
	}

}