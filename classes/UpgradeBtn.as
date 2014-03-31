package  {
	
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class UpgradeBtn extends MovieClip {

		public function UpgradeBtn() {
			addEventListener(MouseEvent.MOUSE_UP, clicked);
			upTxt.text = "";
		}
		
		private function clicked(m:MouseEvent):void {
			dispatchEvent(new Event("clicked"));
		}

	}
	
}
