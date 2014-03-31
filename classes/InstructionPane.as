package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class InstructionPane extends MovieClip {

		private var page:int;

		public function InstructionPane() {
			page = 1;
			
			pButton.gotoAndStop(1);
			pButton.addEventListener(MouseEvent.MOUSE_UP, pClick);
			sButton.gotoAndStop(2);
			sButton.addEventListener(MouseEvent.MOUSE_UP, sClick);
			nButton.gotoAndStop(3);
			nButton.addEventListener(MouseEvent.MOUSE_UP, nClick);
			dButton.gotoAndStop(4);
			dButton.addEventListener(MouseEvent.MOUSE_UP, sClick);
			dButton.visible = false;
			
			gotoPage();
		}
		
		private function gotoPage():void {
			switch (page) {
				case 1:
					ipText.text = "Welcome to Elemental Towers!\n\nClick next to proceed with the instructions\nor click skip to get right to playing";
					pButton.visible = false;
					break;
				case 2:
					ipText.text = "Mouse over a tower in the lower left to\nget a description\n\nClick on one to bring up the tower placer\n\nClick again to place it";
					pButton.visible = true;
					break;
				case 3:
					ipText.text = "Click on a placed tower to see its stats\n\nYou can also upgrade or sell the tower from here\nupgrading increases all of a towers stats\nand the power of its effect\n\nClick anywhere to hide the tower stats";
					break;
				case 4:
					ipText.text = "Your mouse cursor is also a tower\n\nIt can be upgraded by clicking the button below\nthe tower buttons\n\nYou can move your mouse around to\ntarget enemies across the map";
					nButton.visible = true;
					dButton.visible = false;
					break;
				case 5:
					ipText.text = "You are ready to play!\n\nBuild towers to kill enemies, get more money and\nbuy more towers\n\nMake to the 100th wave!";
					nButton.visible = false;
					dButton.visible = true;
					break;
			}
		}
		
		private function pClick(m:MouseEvent):void {
			if(page > 1){
				page--;
			}
			gotoPage();
		}
		
		private function sClick(m:MouseEvent):void {
			dispatchEvent(new Event("done"));
			parent.removeChild(this);
		}
		
		private function nClick(m:MouseEvent):void {
			if(page < 5){
				page++;
			}
			gotoPage();
		}

	}
	
}
