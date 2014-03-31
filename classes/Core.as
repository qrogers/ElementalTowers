/* Elemental Towers
Created by Joseph Quin Rogers
Snailboy Games
*/

package  {
	
	import flash.display.*;
	import flash.events.*;
	import flash.ui.Mouse;
	import flash.net.SharedObject;
	import flash.net.URLRequest;
	import flash.system.Security;
	
	//Cursor tree
	
	public class Core extends MovieClip {

		static const SHIFT = 13;
		
		static var backr:Backr;
		
		private var instructionPane:InstructionPane;
		
		static var towerHandler:TowerHandler;
		static var placer:Placer;
		static var infoPanel:InfoPanel;
		static var statPanel:StatPanel;
		static var creepPanel:CreepPanel;
		static var creepHandler:CreepHandler;
		
		static var colorHolder:ColorHolder;
		
		private var moneyArea:MoneyArea;
		
		private var track:Array;
		private var trackPositions:Array;
		private var fireTowerBtn:TowerBtn;
		private var waterTowerBtn:TowerBtn;
		private var airTowerBtn:TowerBtn;
		private var earthTowerBtn:TowerBtn;
		
		private var grid:Array;
		
		private var gameStarted:Boolean;
		
		private var paramObj:Object = LoaderInfo(root.loaderInfo).parameters;
		private var apiPath:String = paramObj.kongregate_api_path || 
  		"http://www.kongregate.com/flash/API_AS3_Local.swf";
		private var request:URLRequest = new URLRequest(apiPath);
		private var loader:Loader = new Loader();
		private var kongregate:*;
		
		public function Core() {
			loaderInfo.addEventListener(Event.COMPLETE, onCompletelyDownloaded);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressMade);
			Security.allowDomain(apiPath);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
			loader.load(request);
			addChild(loader);
		}
		
		private function onProgressMade(progressEvent:ProgressEvent):void {
			loadedTf.text =  Math.floor(100 *(loaderInfo.bytesLoaded/loaderInfo.bytesTotal)) + "%";
			preloader.width = (loaderInfo.bytesLoaded/loaderInfo.bytesTotal) * 300;
		}
		
		private function loadComplete(e:Event):void {
			kongregate = e.target.content;
   			kongregate.services.connect();
		}
		
		private function onCompletelyDownloaded(e:Event):void {
			gotoAndStop(2);
			
			gameStarted = false;
			
			grid = new Array();
			
			track = new Array();
			trackPositions = new Array();
			trackPositions = [[0,1],[21,1],[21,4],[19,4],[19,6],[21,6],[21,10],[16,10],[16,9],[13,9],[13,11],[10,11],[10,17],[4,17],[4,12],[1,12]];
			
			var i:int;
			var nextTrack:Track;
			var tp:Array = new Array();
			tp = [[0,1],[21,1],[21,4],[19,4],[19,6],[21,6],[21,10],[16,10],[16,9],[13,9],[13,11],[10,11],[10,17],[4,17],[4,12],[1,12]];
			for(i = 0; i < trackPositions.length; i++){
				for(var j:int = 0; j < 2; j++){
					tp[i][j] = ((trackPositions[i][j]) * 26);
				}
			}
			for(i = 0; i < tp.length; i++){
				nextTrack = new Track(tp[i][0], tp[i][1]);
				track[i] = nextTrack;
				addChild(track[i]);
			}
			
			backr = new Backr();
			backr.x = 0;
			backr.y = 0;
			addChild(backr);
			
			towerButtonSetup();
			
			instructionPane = new InstructionPane();
			instructionPane.x = 100;
			instructionPane.y = 100;
			instructionPane.addEventListener("done", gameStart);
			addChild(instructionPane);
			
			statPanel = new StatPanel();
			addChild(statPanel);
			creepPanel = new CreepPanel();
			addChild(creepPanel);
			towerHandler = new TowerHandler(placer);
			towerHandler.addEventListener("sell", sellTower);
			addChild(towerHandler);
			creepHandler = new CreepHandler(track);
			creepHandler.addEventListener("creepFinish", creepFinish);
			creepHandler.addEventListener("win", gameWin);
			creepHandler.addEventListener("nextWave", waveHighScore);
			addChildAt(creepHandler, 1);
			
			infoPanel = new InfoPanel();
			infoPanel.addEventListener("lose", gameOver);
			addChild(infoPanel);
			/*moneyArea = new MoneyArea();
			moneyArea.x = 745;
			moneyArea.y = 575;
			addChildAt(moneyArea, 1);*/
			
			colorHolder = new ColorHolder();
			
			populateGrid();
			
			Mouse.hide();
		}
		
		private function gameStart(e:Event):void {
			creepHandler.gameStart();
			gameStarted = true;
		}
		
		private function gameWin(e:Event){
			var got:GameOverText = new GameOverText();
			got.gotoAndStop(2);
			got.y = 200;
			addChild(got);
			kongregate.stats.submit("Wave", 100);
		}
		
		private function gameOver(e:Event):void {
			if(gameStarted){
				creepHandler.gameOver();
				var got:GameOverText = new GameOverText();
				got.y = 200;
				addChild(got);
				gameStarted = false;
				//infoPanel.newGame();
				//towerHandler.newGame();
			}
		}
		
		private function towerBtnClicked(e:Event):void {
			placer = new Placer(e.target.ele);
			placer.addEventListener("clicked", placerClicked);
			stage.addChild(placer);
			Mouse.hide();
		}
		
		private function placerClicked(e:Event):void {
			var Y:int = Math.floor((placer.y) / (SHIFT * 2));
			var X:int = Math.floor((placer.x) / (SHIFT * 2));
			try {
				if(grid[Y][X] == 0 && infoPanel.getMoney() >= 20){
					towerHandler.place(placer.x + SHIFT, placer.y + SHIFT, e.target.ele);
					/*if(!gameStarted && !stage.contains(instructionPane)){
						gameStarted != gameStarted;
						creepHandler.gameStart();
					}*/
					grid[Y][X] = 1;
				}
			} catch(e:Error){}
			stage.removeChild(placer);
		}
		
		private function sellTower(e:Event):void {
			grid[(towerHandler.getSelectedTower().y / SHIFT / 2) - 1][(towerHandler.getSelectedTower().x / SHIFT / 2) - 1] = 0;
		}
		
		private function creepFinish(e:Event):void {
			infoPanel.setLives(-1);
		}
		
		private function towerButtonSetup():void {
			fireTowerBtn = new TowerBtn("fire");
			fireTowerBtn.addEventListener("clicked", towerBtnClicked);
			fireTowerBtn.x = 50;
			fireTowerBtn.y = 500;
			fireTowerBtn.gotoAndStop(1);
			addChild(fireTowerBtn);
			waterTowerBtn = new TowerBtn("water");
			waterTowerBtn.addEventListener("clicked", towerBtnClicked);
			waterTowerBtn.x = 100;
			waterTowerBtn.y = 500;
			waterTowerBtn.gotoAndStop(2);
			addChild(waterTowerBtn);
			airTowerBtn = new TowerBtn("air");
			airTowerBtn.addEventListener("clicked", towerBtnClicked);
			airTowerBtn.x = 150;
			airTowerBtn.y = 500;
			airTowerBtn.gotoAndStop(3);
			addChild(airTowerBtn);
			earthTowerBtn = new TowerBtn("earth");
			earthTowerBtn.addEventListener("clicked", towerBtnClicked);
			earthTowerBtn.x = 200;
			earthTowerBtn.y = 500;
			earthTowerBtn.gotoAndStop(4);
			addChild(earthTowerBtn);
		}
		
		private function waveHighScore(e:Event){
			kongregate.stats.submit("Wave", creepHandler.getWave());
		}
		
		private function populateGrid():void {
			grid =[
				/*[[0,1],[21,1],[22,4],[19,4],[19,6],[21,6],[21,10],[16,10],[16,9],[13,9],[13,11],[10,11],[10,17],[4,17],[4,11],[1,11]];*/
			 [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
			 [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],
			 [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],
			 [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0],
			 [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0],
			 [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0],
			 [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],
			 [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],
			 [0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0],
			 [0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,1,1,1,0],
			 [0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0],
			 [1,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0],
			 [0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0],
			 [0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0],
			 [0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0],
			 [0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0],
			 [0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0]];
			/*var i:int;
			var j:int;
			for(j = 0; j < trackPositions.length; j++){
				trace(j);
				try {
					if(trackPositions[j][0] < trackPositions[j+1][0]){
						trace("RIGHT");
						for(i = trackPositions[j][0]; i < trackPositions[j+1][0] - trackPositions[j][0]; i++){
							grid[trackPositions[j][1]-1][i] = 1;
						}
					} else if(trackPositions[j][0] > trackPositions[j+1][0]){
						trace("LEFT");
						trace(trackPositions[j+1][0]);
						trace(trackPositions[j][0] - trackPositions[j+1][0]);
						for(i = trackPositions[j+1][0]; i < trackPositions[j][0] - trackPositions[j+1][0]; i++){
							grid[trackPositions[j][1]-1][i] = 1;
						}
					} else if(trackPositions[j][1] < trackPositions[j+1][1]){
						trace("DOWN");
						for(i = trackPositions[j][1]; i <= trackPositions[j+1][1] - trackPositions[j][1] + trackPositions[j][1]; i++){
							grid[i][trackPositions[j][0]-1] = 1;
						}
					}  else if(trackPositions[j][1] > trackPositions[0][1]){
						trace("UP");
						for(i = trackPositions[j][1]; i <= trackPositions[j][1] - trackPositions[0][1] + trackPositions[j][1]; i++){
							grid[i][trackPositions[j][0]-1] = 1;
						}
					} else {
						trace("ELSE");
					}
				} catch(e:Error){
					trace("RETURN");
					trace(trackPositions[j][1]);
					for(i = trackPositions[0][1]; i <= trackPositions[j][1]; i++){
						grid[i][trackPositions[j][0]-1] = 1;
					}
				} finally{}
			}*/
			
			drawGrid(grid);
			
		}
		
		private function drawGrid(grid:Array):void {
			
			var i:int;
			var j:int;
			var square:Square;
			for(i = 0; i < 17; i++){
				for(j = 0; j < 22; j++){
					if(grid[i][j] == 1){
						square = new Square();
						square.x = (j * 26) + 13;
						square.y = (i * 26) + 13;
						addChildAt(square, 1);
						if(i == 0 && j == 0){
							square.gotoAndStop(2);
						}
					}
				}
			}
			square = new Square();
			square.x = (0 * 26);
			square.y = (0 * 26) + 13;
			addChildAt(square, 1);
			square = new Square();
			square.x = (0 * 26);
			square.y = (11 * 26) + 13;
			addChildAt(square, 1);
		}
	}
	
}
