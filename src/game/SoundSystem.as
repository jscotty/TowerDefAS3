package game 
{
	import adobe.utils.CustomActions;
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	
	/**
	 * 
	 * 0 = background music
	 * 1 = shoot sound turret
	 * 
	 * @author justin Bieshaar
	 */
	public class SoundSystem extends Sprite
	{
		
		private var sound:Array = [];
		private var soundChannel:SoundChannel;
		private var sfx:Sound;
		
		
		public function SoundSystem() 
		{
			sound = new Array();
			soundChannel = new SoundChannel();
		}
		
		public function addMusic(soundType:String):void {
			sfx = new Sound;
			sfx.load(new URLRequest(soundType));
			sound.push(sfx);
		}
		
		public function playMusic(id:int, volume:int, loop:Boolean):void {
			var soundTrans:SoundTransform = new SoundTransform(volume, 0);
			
			if(!loop){
				soundChannel = sound[id].play(0, 1, soundTrans);
			}else {
				soundChannel = sound[id].play(0, 99999, soundTrans);
			}
		}
		
	}

}