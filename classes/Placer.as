package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Placer extends MovieClip {
		
		public var ele:String;
		
		public function Placer(typ:String) {
			ele = typ;
			if(ele == "fire"){
				rangeDisplay.width = 200;
				rangeDisplay.height = 200;
			} else if(ele == "water"){
				rangeDisplay.width = 180;
				rangeDisplay.height = 180;
			} else if(ele == "air"){
				rangeDisplay.width = 190;
				rangeDisplay.height = 190;
			} else if(ele == "earth"){
				rangeDisplay.width = 180;
				rangeDisplay.height = 180;
			}
			addEventListener(Event.ENTER_FRAME, eFrame);
			addEventListener(MouseEvent.MOUSE_UP, clicked);
		}
		
		private function eFrame(e:Event):void {
			x = Math.floor(stage.mouseX / 26) * 26 + 13;
			y = Math.floor(stage.mouseY / 26) * 26 + 13;
		}
		
		private function clicked(m:MouseEvent):void {
			removeEventListener(Event.ENTER_FRAME, eFrame);
			dispatchEvent(new Event("clicked"));
		}
	}
	
}
