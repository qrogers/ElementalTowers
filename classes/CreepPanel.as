package  {
	
	import flash.text.*;
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.*;
	
	public class CreepPanel extends MovieClip {
		
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
		
		public function CreepPanel() {
			txtField = new TextField();
			txtField.embedFonts = true;
			tf = new TextFormat("TNR");
			tf.size = 24;
			tf.color = 0xFFFFFF;
			txtField.setTextFormat(tf);
			txtField.x = 250;
			txtField.y = 535;
			txtField.width = 200;
			txtField.height= 200;
			txtField.text = "TEXT";
			txtField.selectable = false;
			txtField.wordWrap = true;
			var outline:GlowFilter = new GlowFilter(0x000000,1.0,2.0,2.0,10);
			outline.quality = BitmapFilterQuality.MEDIUM;
			txtField.filters = [outline];
			txtField.setTextFormat(tf);
			addChild(txtField);
		}
		
		public function setText(txt:String):void {
			txtField.text = txt;
			txtField.setTextFormat(tf);
		}

	}
	
}
