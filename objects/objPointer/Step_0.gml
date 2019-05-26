//update based on input
if self.armed {
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
		self.x = pointedTo.x
		self.y = pointedTo.y
	}
}