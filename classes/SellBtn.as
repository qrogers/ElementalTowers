package  {
	
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class SellBtn extends MovieClip {

		public function SellBtn() {
			addEventListener(MouseEvent.MOUSE_UP, clicked);
		}
		
		private function clicked(m:MouseEvent):void {
			dispatchEvent(new Event("clicked"));
		}

	}
	
}