if (global.gamestate != game_state.throwing){
	return
}

if (global.screenstate == throw_screen_state.plunging){
	if self.sprite_index != sprManInGlass{
		self.sprite_index = sprManInGlass
		self.image_index = 0
	}else{
		if self.image_index > self.image_number - 1 {
			global.screenstate = throw_screen_state.drinking
		}
	}
	self.count = 0
}

if (global.screenstate == throw_screen_state.drinking) {
	self.count ++
	if self.sprite_index != sprManDrinkingGlass{
		self.sprite_index = sprManDrinkingGlass
		self.image_index = 0;
	}
	if global.player == playing.player { // player playing, cpu drinking
		var beer_step = irandom(5)
		self.remaining_beer -= beer_step
	} else if global.player == playing.cpu {
		if (global.act != self.previous_act){
			self.remaining_beer -= 1
		}
	}
	
	self.image_index = self.image_number * (1 - (self.remaining_beer / 100))
	
	if (self.remaining_beer <= 0){
		show_debug_message("Drinking over, go again")
		var drinker = noone
		if global.player == playing.cpu {
			drinker = global.team_player[global.team_player_index]
			show_debug_message("Score player drinking: " + string(self.count))
		} else {
			drinker = global.team_cpu[global.team_cpu_index]
		}
		show_debug_message("Drinker was " + drinker.name)
		var drunk = ceil(self.count / 100)
		show_debug_message("Adding drunkeness " + string(drunk))
		drinker.drunkenness += drunk
		show_debug_message("Totall drunkeness " + string(drinker.drunkenness))
		self.sprite_index = sprFullSteinBubbling
		self.image_index = 0
		global.screenstate = throw_screen_state.start_throw
		self.remaining_beer = 100
		changePlayer()
	}
}