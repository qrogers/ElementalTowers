package  {
	
	import flash.display.MovieClip;
	import flash.display.*;
	import flash.geom.*;
	
	public class ColorDisplay extends MovieClip {
		
		public var g:MovieClip = new MovieClip();
		public var h:Array = new Array();
		
		public function ColorDisplay() {
			for(var i:int; i < 200; i++){
				h[i] = (g = new MovieClip());
			}
			for(i = 0; i < (h.length / 2); i++){
				h[i].graphics.beginFill(0);
				h[i].transform.colorTransform = ColorHolder.getColor(3, 1);
				h[i].graphics.drawCircle(i * 40,15,8);
				h[i].graphics.endFill();
				addChild(h[i]);
			}
			for(i = (h.length / 2); i < h.length; i++){
				h[i].graphics.beginFill(0);
				h[i].transform.colorTransform = ColorHolder.getColor((i - (h.length / 2)), 0);
				h[i].graphics.drawCircle(((i - (h.length / 2)) * 40),15,7);
				h[i].graphics.endFill();
				addChild(h[i]);
			}
		}
	}
	
}
