package game 
{
	import adobe.utils.CustomActions;
	import flash.display.Sprite;
	import flash.events.Event;
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
		private var soundNum:int = 0;
		private var soundVolume:Number;
		private var soundVolumeArray:Array = [];
		private var soundTrans:SoundTransform;
		
		
		public function SoundSystem() 
		{
			sound = new Array();
			soundChannel = new SoundChannel();
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
		}
		
		private function stopMusic():void 
		{
				soundChannel.stop();
		}
		
		public function addMusic(soundType:String):void {
			sfx = new Sound;
			sfx.load(new URLRequest(soundType));
			sound.push(sfx);
		}
		
		public function playMusic(id:int, volume:Number, loop:Boolean):void {
			this.soundVolume = volume;
			if (Main.soundOff) {
				soundVolume = 0;
			}
			soundTrans = new SoundTransform(soundVolume, 0);
			
			if(!loop){
				soundChannel = sound[id].play(0, 1, soundTrans);
			}else {
				soundChannel = sound[id].play(0, 99999, soundTrans);
			}
		}
		
	}

}