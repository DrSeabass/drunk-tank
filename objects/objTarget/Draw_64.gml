if self.aimed_at {
	var ret_x = x + self.aim_x
	var ret_y = y + self.aim_y
	draw_sprite(sprReticle, 0, ret_x, ret_y)
}