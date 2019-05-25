// consider drunk motion
if (global.gamestate != game_state.throwing)
	return// we aren't on this screen, early exit
	
if (global.screenstate == throw_screen_state.start_throw){
		self.count = 0
		self.x_displace = 0
		self.y_displace = 0
		self.drift_x = 0
		self.drift_y = 0
		global.screenstate = throw_screen_state.throw_input
}else if (global.screenstate == throw_screen_state.throw_input){
	if (global.remaining_throws == 0) {
		changePlayer();
		return
	}
	self.count ++
	if (self.sample_window <= 0){
		self.drift_x = irandom_range(-1, 1)
		self.drift_y = irandom_range(-1, 1)
		self.sample_window = self.controller_base_dex - self.controller_drunkenness


		// deal with bounding box on drift
		if (abs(self.x_displace) >= self.max_x_dither){
			if ((self.x_displace > 0 && self.drift_x > 0) ||
				(self.x_displace < 0 && self.drift_x < 0)){
					drift_x *= -1
			}
		}

		if (abs(self.y_displace) >= self.max_y_dither){
			if ((self.y_displace > 0 && self.drift_y > 0) ||
				(self.y_displace < 0 && self.drift_y < 0)){
					drift_y *= -1
				}
		}
	}

	// combine user input with drift
	if global.left
		self.drift_x --
	if global.right
		self.drift_x ++
	if global.up
		self.drift_y --
	if global.down
		self.drift_y ++

	self.sample_window --
	self.x_displace += drift_x
	self.y_displace += drift_y

	if global.player == playing.player {
		if self.x_displace > self.max_x_dither
			self.x_displace = self.max_x_dither
		else if self.x_displace < (0 - self.max_x_dither)
			self.x_displace = 0 - self.max_x_dither

		if self.y_displace > self.max_y_dither
			self.y_displace = self.max_y_dither
		else if self.y_displace < (0 - self.max_y_dither)
			self.y_displace = 0 - self.max_y_dither
	}else{
		// cpu action
	}
	// update target reticle
	if (self.target != noone) {
		self.target.aimed_at = true
		self.target.aim_x = self.x_displace
		self.target.aim_y = self.y_displace
	}
	
	if global.player == playing.player {
		if global.act {
			global.screenstate = throw_screen_state.throwing
			global.remaining_throws --
		}
	}else{
	  // cpu throw decision
	  var will_hit = abs(target.aim_x < 10) && (target.aim_y < 10)
	  if (self.count > 100) || (will_hit && random(1) < (1 - (self.controller_drunkenness / self.max_stamina))){
		  	global.screenstate = throw_screen_state.throwing
			global.remaining_throws --
	  }
	}
} else if (global.screenstate == throw_screen_state.throwing){
	self.count = 0
	self.x_displace += 5;
	self.y_displace += 5;
	if ((self.x + x_displace) > 1024 
		&& (self.y + self.y_displace) > 768){
			global.screenstate = throw_screen_state.ball_in_flight
			ball = instance_create_depth(512, 384, -1, objThrownBall)
			ball.start_x = 512
			ball.start_y = 384
			ball.target = self.target
			ball.target_x = self.target.x + self.target.aim_x
			ball.target_y = self.target.y + self.target.aim_y
			ball.visible = true
	}
}