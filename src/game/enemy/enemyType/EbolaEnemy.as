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
			addChild(enemy);
			enemy.width = 64;
			enemy.height = 32;
			
			health = 100;
			speed = 3.4;
			scaleFactor = 0.0003;
			points = 250;
		}
		
	}

}