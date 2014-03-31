package  {
	
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class CursorUpgradeBtn extends MovieClip {

		public function CursorUpgradeBtn() {
			addEventListener(MouseEvent.MOUSE_UP, clicked);
		}
		
		private function clicked(m:MouseEvent):void {
			dispatchEvent(new Event("clicked"));
		}

	}
	
}