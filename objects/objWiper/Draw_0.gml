var ind = 0;
var h_steps = ceil(room_width / sprite_width);
var v_steps = ceil(room_height * 2.5 / self.maxStep);
var thisX = 0

// set Y based on step s.t. top row moves down and off, bottom row moves up and off
var topY = v_steps * self.step
var bottomY = room_height - v_steps * self.step

for (ind = 0; ind < h_steps; ind++){
	// draw bottles up
	draw_sprite_ext(sprite_index, 0, thisX, topY ,1,-1,0,c_white,1);
	thisX += sprite_width;
}
thisX = sprite_width / -2
// draw bottles down
for (ind = 0; ind <= h_steps; ind++){
	// draw bottles up
	draw_sprite_ext(sprite_index, 0, thisX, bottomY ,1,1,0,c_white,1);
	thisX += sprite_width;
}