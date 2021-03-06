//update based on input
var selecting = false
var armedStart = self.armed
if self.armed {
	if global.select{
		selecting = true
		self.armed = false
	}
	if global.left{
		self.armed = false
		self.col --
	}
	if global.right{
		self.armed = false
		self.col++
	}
	if global.up{
		self.row --
		self.armed = false
	}
	if global.down {
		self.row ++
		self.armed = false
	}
	
	if self.armed == false {
		alarm_set(0,10)
	}
}

if (armedStart != self.armed){
	audio_play_sound(moveSelect, 10, false);
}

// wrap
if self.row < 0 {
	self.row += 3
} else if self.row >= 3 {
	self.row -= 3
}

if self.col < 0 {
	self.col += 3
}else if self.col >= 3 {
	self.col -= 3
}

if pointing_at != noone {
	var index = self.row * 3 + self.col
	var pointedTo = noone
	if index >= 0 && index < array_length_1d(self.pointing_at){
		pointedTo = self.pointing_at[index]
	}
	if (pointedTo != noone){
		self.nm_display.pointing_at = pointedTo
		self.st_display.pointing_at = pointedTo
		if selecting{
			pointedTo.selected = !pointedTo.selected
			if pointedTo.selected {
				audio_play_sound(onSelect, 10, false)
				global.selected_players ++
				if (global.selected_players == 3){
					self.visible = false
					
					startThrowing()
				}
			}else{
				global.selected_players --
			}
		}
		self.x = pointedTo.x
		self.y = pointedTo.y
	}
}