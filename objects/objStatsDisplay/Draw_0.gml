if (self.pointing_at != noone){
	var w = 50
	var h = 50
	for(var i = 0; i < self.pointing_at.dexterity; i++){
		draw_sprite_stretched(sprBaseball, 0, self.x + (w + 5) * i, self.y, w, h)
	}
	for(var i = 0; i < self.pointing_at.constitution; i++){
		draw_sprite_stretched(sprSelected, 0, self.x + (w + 5) * i, self.y + h * 1.25, w, h)
	}
}