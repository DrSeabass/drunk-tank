if (self.pointing_at != noone){
	draw_set_font(fntGameText)
	draw_text(self.x, self.y, pointing_at.name)
	draw_text(self.x, self.y + 30, pointing_at.quote)
}