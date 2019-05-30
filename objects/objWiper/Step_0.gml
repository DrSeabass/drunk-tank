self.step ++

if self.nextRoom > 0 && (self.step == self.maxStep / 2){
	room_goto(self.nextRoom)
}

if self.step > self.maxStep {
	if (self.nextScreenState > 0) {
		global.screenstate = self.nextScreenState;
	}
	instance_destroy();
}