package {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.geom.*;
	
	public class Plode extends MovieClip {

		public function Plode(xPar:Number, yPar:Number, spread:int, color:ColorTransform) {
			this.transform.colorTransform = color;
			x +=  xPar + ((Math.random() * spread) - (spread / 2));
			y +=  yPar + ((Math.random() * spread) - (spread / 2));
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		
		private function eFrame(e:Event):void {
			if (alpha <= 0) {
				removeEventListener(Event.ENTER_FRAME, eFrame);
				parent.removeChild(this);
			}
			else {
				alpha -=  .1;
			}
		}
	}

}