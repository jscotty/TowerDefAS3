package game.enemy.enemyType 
{
	import assets.NEnemyPH;
	import game.enemy.Enemy;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class NormalEnemy extends Enemy
	{
		private var enemy:NEmeny;
		
		public function NormalEnemy() 
		{
			enemy = new NEmeny();
			addChild(enemy);
			enemy.width = 64;
			enemy.height = 64;
			
			health = 100;
			speed = 6;
			mass = 3;
		}
		
	}

}