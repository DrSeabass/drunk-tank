var x_disp = floor((self.start_x - self.target_x) * (self.step_index / self.throw_steps))
var y_disp = floor((self.start_y - self.target_y) * (self.step_index / self.throw_steps))

self.x = self.start_x - x_disp
self.y = self.start_y - y_disp
self.image_xscale = 1 - 0.9 * (self.step_index / self.throw_steps)
self.image_yscale = 1 - 0.9 * (self.step_index / self.throw_steps)

self.step_index ++

if (self.step_index > self.throw_steps){
	show_debug_message("Throw is over, end throw somehow...")
	if (abs(self.target.aim_x) < 10  &&  abs(self.target.aim_y) < 10){
	  //hit
		global.screenstate = throw_screen_state.plunging
	}else{
		global.screenstate = throw_screen_state.start_throw
	}
	instance_destroy();
}