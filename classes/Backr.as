package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Backr extends MovieClip {
		
		
		public function Backr() {
			addEventListener(MouseEvent.MOUSE_UP, clicked);
		}
		
		private function clicked(e:Event):void {
			dispatchEvent(new Event("clicked"));
		}
	}
	
}
