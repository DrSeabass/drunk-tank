if self.aimed_at && global.screenstate == throw_screen_state.throw_input {
	var ret_x = x + self.aim_x
	var ret_y = y + self.aim_y
	draw_sprite(sprReticle, 0, ret_x, ret_y)
}