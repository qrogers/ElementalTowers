package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class GameOverText extends MovieClip {
		
		
		public function GameOverText() {
			alpha = 0;
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		
		private function eFrame(e:Event):void {
			alpha += .01;
		}
	}
	
}
