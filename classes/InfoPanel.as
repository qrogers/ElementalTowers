package  {
	
	import flash.text.*;
	import flash.events.*;
	import flashx.textLayout.utils.CharacterUtil;
	import flash.filters.*;
	
	public class InfoPanel extends TextField {

		private var money:Number;
		private var lives:int;
		private var tf:TextFormat;
		
		[Embed(systemFont="Times New Roman", 
    fontName = "TNR", 
    mimeType = "application/x-font", 
    fontWeight="normal", 
    fontStyle="normal", 
    advancedAntiAliasing="true", 
    embedAsCFF="false")]
		private var font:Class;

		public function InfoPanel() {
			embedFonts = true;
			tf = new TextFormat("TNR");
			tf.size = 24;
			tf.color = 0xFFFFFF;
			var outline:GlowFilter = new GlowFilter(0x000000,1.0,2.0,2.0,10);
			outline.quality = BitmapFilterQuality.MEDIUM;
			this.filters = [outline];
			newGame();
			x = 250;
			y = 485;
			width = 300;
			height = 50;
			setInfoPanel();
			selectable = false;
			this.setTextFormat(tf);
		}
		
		private function setInfoPanel():void {
			text = "Money: " + Math.floor(money).toString() + " Lives: " + lives.toString();
			this.setTextFormat(tf);
		}
		
		public function newGame():void {
			money = Core.creepHandler.getMoneyAtStart() + 50;
			lives = 25;
		}
		
		public function setMoney(amount:Number):void {
			money += amount;
			setInfoPanel();
		}
		
		public function setLives(amount:int):void {
			lives += amount;
			if(lives <= 0){
				dispatchEvent(new Event("lose"));
			}
			setInfoPanel();
		}
		
		public function getMoney():int {
			return(money);
		}

	}
	
}
