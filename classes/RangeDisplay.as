package  {
	
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class RangeDisplay extends MovieClip {

		public function RangeDisplay() {
			addEventListener(MouseEvent.MOUSE_UP, clicked);
		}
		
		private function clicked(m:MouseEvent):void {
			dispatchEvent(new Event("clicked"));
		}

	}
	
}