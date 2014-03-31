package  {
	
	import flash.text.*;
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.*;
	
	public class StatPanel extends MovieClip {

		public var upgradeBtn:UpgradeBtn;
		public var sellBtn:SellBtn;
		public var cursorUpgradeBtn:CursorUpgradeBtn;
		
		private var txtField:TextField;
		private var tf:TextFormat;
		
		[Embed(systemFont="Times New Roman", 
    fontName = "TNR", 
    mimeType = "application/x-font", 
    fontWeight="normal", 
    fontStyle="normal", 
    advancedAntiAliasing="true", 
    embedAsCFF="false")]
		private var font:Class;
		
		public function StatPanel() {
			upgradeBtn = new UpgradeBtn();
			upgradeBtn.x = 625;
			upgradeBtn.y = 250;
			upgradeBtn.upTxt.y += Math.round((upgradeBtn.upTxt.height - upgradeBtn.upTxt.textHeight) / 4) - 5;
			upgradeBtn.addEventListener("clicked", upgradeBtnClicked);
			addChild(upgradeBtn);
			sellBtn = new SellBtn();
			sellBtn.x = 625;
			sellBtn.y = 335;
			sellBtn.sellTxt.y += Math.round((sellBtn.sellTxt.height - sellBtn.sellTxt.textHeight) / 1) - 15;
			sellBtn.addEventListener("clicked", sellBtnClicked);
			addChild(sellBtn);
			txtField = new TextField();
			tf = new TextFormat("TNR");
			tf.size = 25;
			tf.color = 0xFFFFFF;
			txtField.embedFonts = true;
			txtField.setTextFormat(tf);
			txtField.x = 635;
			txtField.y = 5;
			txtField.width = 200;
			txtField.height= 200;
			txtField.text = "";
			txtField.selectable = false;
			txtField.wordWrap = true;
			var outline:GlowFilter = new GlowFilter(0x000000,1.0,2.0,2.0,10);
			outline.quality = BitmapFilterQuality.MEDIUM;
			txtField.filters = [outline];
			addChild(txtField);
			hideButtons();
			
			cursorUpgradeBtn = new CursorUpgradeBtn();
			cursorUpgradeBtn.x = 25;
			cursorUpgradeBtn.y = 540;
			cursorUpgradeBtn.addEventListener("clicked", cursorUpgradeBtnClicked);
			addChild(cursorUpgradeBtn);
		}
		
		public function setText(txt:String):void {
			txtField.text = txt;
			txtField.setTextFormat(tf);
		}
		
		public function hideButtons():void {
			upgradeBtn.visible = false;
			sellBtn.visible = false;
		}
		
		public function showButtons():void {
			upgradeBtn.visible = true;
			sellBtn.visible = true;
		}
		
		private function upgradeBtnClicked(e:Event):void {
			dispatchEvent(new Event("upgrade"));
		}
		
		private function sellBtnClicked(e:Event):void {
			dispatchEvent(new Event("sell"));
		}
		
		private function cursorUpgradeBtnClicked(e:Event):void {
			Core.towerHandler.cursorTowerUpgrade();
		}

	}
	
}
