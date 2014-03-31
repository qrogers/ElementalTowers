package  {
	
	public class FireTower extends Tower {

		//override public const txt:String = "Fire Tower";
		
		public function FireTower(typ:int) {
			super(typ);
			txt = "Fire Tower";
			stats = [[90, 0, 0, 100, 1, 2, 15],//dmg, slow, psn, rng, amp, atkSpeed, bulletSpd
					[100, 0, 0, 110, 1, 1.9, 15],
					[120, 0, 0, 120, 1, 1.8, 15],
					[150, 0, 0, 130, 1, 1.7, 15],
					[180, 0, 0, 140, 1, 1.6, 15],
					[250, 0, 0, 155, 1, 1.5, 18]];
		}

	}
	
}
