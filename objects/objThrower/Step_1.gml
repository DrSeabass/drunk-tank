// consider drunk motion
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
self.sample_window --
self.x_displace += drift_x
self.y_displace += drift_y

self.x += drift_x
self.y += drift_y

// update target reticle
if (self.target != noone) {
	self.target.aimed_at = true
	self.target.aim_x = self.x_displace
	self.target.aim_y = self.y_displace
}