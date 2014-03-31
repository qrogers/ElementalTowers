package  {
	
	import flash.display.*;
	import flash.events.*;
	
	public class TowerHandler extends MovieClip {

		private var towerHolder:Array;
		private var creepHolder:Array;
		
		private var towerInfo:Array;
		
		private var selectedTower:Tower;
		private var rangeDisp:RangeDisplay;
		
		private var counter:int;
		
		public function TowerHandler(placer:Placer) {
			addEventListener(Event.ENTER_FRAME, eFrame);
			Core.statPanel.addEventListener("upgrade", towerUpgrade);
			Core.statPanel.addEventListener("sell", towerSell);
			Core.backr.addEventListener("clicked", backrClicked);
			towerHolder = new Array();
			creepHolder = new Array();
			counter = 0;
			place(0, 0, "cursor");
			Core.statPanel.cursorUpgradeBtn.upTxt.text = "Upgrade Mouse Tower: -$" + (10 * towerHolder[0].level + 10);
		}
		
		public function place(xl:int, yl:int, type:String):void {
			var newTower:Tower;
			if(type == "fire"){
				newTower = new FireTower(1);
			} else if(type == "water"){
				newTower = new WaterTower(2);
			} else if(type == "air"){
				newTower = new AirTower(3);
			} else if(type == "earth"){
				newTower = new EarthTower(4);
			} else if(type == "cursor"){
				newTower = new CursorTower(5);
			}
			newTower.x = xl;
			newTower.y = yl;
			towerHolder.push(newTower);
			addChildAt(newTower, 0);
			if(type != "cursor"){
				newTower.addEventListener("clicked", towerClicked);
				Core.infoPanel.setMoney(-20);
			}
		}
		
		private function eFrame(e:Event):void {
			var i:int;
			var j:int;
			for(i = 0; i < towerHolder.length; i++){
				for(j = 0; j < creepHolder.length; j++){
					if(Validator.getDistance(towerHolder[i], creepHolder[j]) < towerHolder[i].getRange()){
						towerHolder[i].attackTarget(creepHolder[j]);
						break;
					}
				}
			}
			/*if(stage.mouseX >= 745 && stage.mouseY >= 575 && stage.mouseX <= 790 && stage.mouseY <= 620){
				counter++;
				if(counter >= 48){
					Core.infoPanel.setMoney(1);
					counter = 0;
				}
			}*///Money area
		}
		
		public function newGame():void {
			for(var i:int = 0; i < towerHolder.length; i++){
				removeChild(towerHolder[i]);
			}
			towerHolder = new Array();
			creepHolder = new Array();
			counter = 0;
			place(0, 0, "cursor");
			Core.statPanel.cursorUpgradeBtn.upTxt.text = "Upgrade Mouse Tower: -$" + (10 * towerHolder[0].level + 10);
			
		}
		
		private function towerUpgrade(e:Event):void {
			if (selectedTower != null) {
				if(selectedTower.level < 5 && (10 * selectedTower.level + 10) <= Core.infoPanel.getMoney()){
					Core.infoPanel.setMoney(-10 * selectedTower.level - 10);
					selectedTower.levelUp();
					removeChild(rangeDisp);
					displayRange(selectedTower);
					setStatText(selectedTower);
					if(selectedTower.level < 5){
						Core.statPanel.upgradeBtn.upTxt.text = "Upgrade: -$" + (10 * selectedTower.level + 10);
					} else {
						Core.statPanel.upgradeBtn.upTxt.text = "--";
					}
					Core.statPanel.sellBtn.sellTxt.text = "Sell: +$" + (10 * selectedTower.level + 15);
				}
			}
		}
		
		public function cursorTowerUpgrade(){
			if(towerHolder[0].level < 5 && (10 * towerHolder[0].level + 10) <= Core.infoPanel.getMoney()){
				Core.infoPanel.setMoney(-10 * towerHolder[0].level - 10);
				towerHolder[0].levelUp();
				Core.statPanel.cursorUpgradeBtn.upTxt.text = "Upgrade Mouse Tower: -$" + (10 * towerHolder[0].level + 10);
				if(towerHolder[0].level >= 5){
					Core.statPanel.cursorUpgradeBtn.visible = false;
				}
			}
		}
		
		private function towerSell(e:Event):void {
			if (selectedTower != null) {
				dispatchEvent(new Event("sell"));
				Core.infoPanel.setMoney(10 * selectedTower.level + 15);
				selectedTower.sold();
				removeChild(selectedTower);
				removeChild(rangeDisp);
				selectedTower = null;
				Core.statPanel.setText("");
				Core.statPanel.upgradeBtn.upTxt.text = "";
				Core.statPanel.sellBtn.sellTxt.text = "";
				Core.statPanel.hideButtons();
			}
		}
		
		public function getSelectedTower():Tower {
			return(selectedTower);
		}
		
		private function towerClicked(e:Event):void {
			if(e.target != selectedTower){
			try{
			   removeChild(rangeDisp);
			} catch(e:Error){}
				if(e != null){
					setStatText(e.target as Tower);
					selectedTower = e.target as Tower;
				} else {
					setStatText(selectedTower);
				}
				displayRange(selectedTower);
				setChildIndex(selectedTower, numChildren - 2);
				if(selectedTower.level < 5){
					Core.statPanel.upgradeBtn.upTxt.text = "Upgrade: -$" + (10 * selectedTower.level + 10);
				} else {
					Core.statPanel.upgradeBtn.upTxt.text = "--";
				}
				Core.statPanel.sellBtn.sellTxt.text = "Sell: +$" + (10 * selectedTower.level + 15);
			}
			Core.statPanel.showButtons();
		}
		
		private function displayRange(st:Tower):void {
			rangeDisp = new RangeDisplay();
			rangeDisp.width = st.getRange() * 2;
			rangeDisp.height = st.getRange() * 2;
			rangeDisp.x = st.x;
			rangeDisp.y = st.y;
			rangeDisp.addEventListener("clicked", backrClicked);
			addChildAt(rangeDisp, 0);
		}
		
		private function setStatText(tower:Tower):void {
			Core.statPanel.setText(tower.txt + "\nDamage: " + tower.stats[tower.level][0] + "\nFire Rate:\n" + (int(((tower.stats[tower.level][3]/24)*100))/100) + " shots/sec\nLevel: " + tower.level);
		}
		
		private function backrClicked(e:Event):void {
			selectedTower = null;
			try{
			   removeChild(rangeDisp);
			} catch(e:Error){}
			Core.statPanel.setText("");
			Core.statPanel.upgradeBtn.upTxt.text = "";
			Core.statPanel.sellBtn.sellTxt.text = "";
			Core.statPanel.hideButtons();
		}
		
		public function updateCreepHolder(ch:Array):void {
			creepHolder = ch;
		}
		
		public function getTowerHolder():Array {
			return(towerHolder);
		}

	}
	
}
