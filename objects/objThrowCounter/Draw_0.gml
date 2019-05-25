var y_offset = floor(sprite_height / 3)
var cx = x
var cy = y
for (var i = 0; i < global.remaining_throws; i++){
	draw_sprite_stretched(self.sprite_index, 0, cx, cy, self.sprite_width, self.sprite_height);
	cy += self.sprite_height + y_offset;
}
