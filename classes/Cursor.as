package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.geom.*;
	
	public class Cursor extends MovieClip {
		
		private var lastX:Number;
		private var lastY:Number;
		private var colorTransform:ColorTransform;
		
		public function Cursor() {
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		
		private function eFrame(e:Event):void {
			x = stage.mouseX;
			y = stage.mouseY;
			if((lastX != x || lastY != y) && visible == true){
				var newPlode:Plode = new Plode(x, y, 20, new ColorTransform());
				colorTransform = new ColorTransform();
				colorTransform.color = 0x000000;
				newPlode.transform.colorTransform = colorTransform;
				stage.addChild(newPlode);
			}
			mouseEnabled = false;
			lastX = x;
			lastY = y;
		}
	}
	
}
