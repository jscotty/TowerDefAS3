package game 
{
	import com.blueflamedev.effects.ParticleSeed;
	import com.blueflamedev.events.ParticleEvent;
	import com.blueflamedev.math.Vector3D;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import utils.Vector2D;
	import bullets.NormalBulletType;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class ParticleSystem extends Sprite
	{
		private var particleSeed:ParticleSeed;
		
		private var holder:Sprite;
		
		private var weakBullet:BulletWeak;
		private var normalBullet:BulletNormal;
		private var strongBullet:BulletStrong;
		private var heavyBullet:BulletHeavy;
		
		private var weak:String = "weak";
		private var normal:String = "normal";
		private var strong:String = "strong";
		private var heavy:String = "heavy";
		
		private var enemyNum:int;
		
		private var enemy:Array = [];
		public var died:Boolean = false;
		
		public function createParticle(textureType:String, enemyNum:int):void
		{
			this.enemyNum = enemyNum;
			enemy = Game.enemyArray;
			
			holder = new Sprite();
			addChild(holder);
			holder.x = 800;
			holder.y = 600;
			
			if (textureType == weak) {
				startParticle(weak);
			} else if (textureType == normal) {
				startParticle(normal);
			} else if (textureType == strong) {
				startParticle(strong);
			} else if (textureType == heavy) {
				startParticle(heavy);
			}
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			this.x = enemy[enemyNum].x - 1885;
			this.y = enemy[enemyNum].y - 1110;
			
			if (enemy[enemyNum].died) {
				died = true;
			}
		}
		
		private function startParticle(type:String):void 
		{
			var randomnum:int = Math.random() * 4 - 4;
			
			particleSeed = new ParticleSeed(holder);
			if(type == weak) particleSeed.particle = BulletWeak;
			else if(type == normal) particleSeed.particle = BulletNormal;
			else if(type == strong) particleSeed.particle = BulletStrong;
			else if(type == heavy) particleSeed.particle = BulletHeavy;
			particleSeed.bounds = new Rectangle(10, 10, 10, 10);
			particleSeed.force = new Vector3D(0, -.1, 0);
			particleSeed.setMagnitude(0, 0);
			particleSeed.releaseInterval = 1000;
			particleSeed.duration = 155;
			particleSeed.start();
			holder.addChildAt(particleSeed, 1);
		}
		
		
	}

}