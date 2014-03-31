package  {
	
	import flash.text.*;
	import flash.filters.*;
	
	public class TowerText extends TextField {

		public function TowerText(type:String, xl:int, yl:int) {
			x = xl- 45;
			y = yl - 100;
			var tf = new TextFormat();
			tf.size = 14;
			tf.color = 0xFFFFFF;
			var outline:GlowFilter = new GlowFilter(0x000000,1.0,2.0,2.0,10);
			outline.quality = BitmapFilterQuality.MEDIUM;
			this.filters = [outline];
			text = getTowerText(type);
			width = 300;
			height = 75;
			this.setTextFormat(tf);
		}
		
		private function getTowerText(type:String):String {
			switch(type) {
				case "fire":
					return("Fire Tower:\nThe Fire Tower deals high damage in\nan area of effect");
				case "water":
					return("Water Tower:\nThe Water Tower slows target.\nThe slow stacks with dimishing effect\nbut deals more damage");
				case "air":
					return("Wind Tower:\nThe Wind Tower poisons targets.\nThe Poison damage and duration stack");
				case "earth":
					return("Earth Tower:\nThe Earth Tower increases damsge done\nby all towers.\nAplification stacks with diminishing effect");
			}
			return("EMPTY");
		}

	}
	
}
