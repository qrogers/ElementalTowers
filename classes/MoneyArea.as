package  {
	
	import flash.display.MovieClip;
	import flash.ui.Mouse;
	import flash.events.*;
	
	public class MoneyArea extends MovieClip {
		
		private var alphaDrop:Boolean;
		
		public function MoneyArea() {
			alphaDrop = true;
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		
		private function eFrame(e:Event):void {
			if(alphaDrop == true){
			   moneySign.alpha -= .05;
			   if(moneySign.alpha <= 0){
				   alphaDrop = false;
			   }
			} else if(alphaDrop == false){
			   moneySign.alpha += .05;
			   if(moneySign.alpha >= 1){
				   alphaDrop = true;
			   }
			}
		}
	}
	
}
