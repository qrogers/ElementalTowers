package  {
	
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class TowerBtn extends MovieClip {
		
		public var ele:String;
		
		private var tt:TowerText;
		
		public function TowerBtn(typ:String) {
			ele = typ;
			addEventListener(MouseEvent.MOUSE_UP, clicked);
			addEventListener(MouseEvent.ROLL_OVER, over);
			addEventListener(MouseEvent.ROLL_OUT, out);
			trace(ele);
		}
		
		private function clicked(m:MouseEvent):void {
			dispatchEvent(new Event("clicked"));
		}
		
		private function over(m:MouseEvent):void {
			tt = new TowerText(ele, x, y);
			stage.addChild(tt);
		}
		
		private function out(m:MouseEvent):void {
			stage.removeChild(tt);
		}

	}
	
}
