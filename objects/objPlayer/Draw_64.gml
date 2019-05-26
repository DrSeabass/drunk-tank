if self.selected {
	var h = floor(1.5 * sprite_get_height(sprSelected))
	var w = floor(1.5 * sprite_get_width(sprSelected))
	draw_sprite_stretched(sprSelected, 0, self.x - w, self.y - h/2, w, h)
}