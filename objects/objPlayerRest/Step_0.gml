if ((self.index == global.team_player_index && self.team = playing.player)
	|| (self.index == global.team_cpu_index && self.team = playing.cpu)){
		sprite_index = self.character.emptyChair
}else{
	if self.character.drunkenness > self.character.constitution{
		sprite_index = self.character.hammeredChair
	}else{
		sprite_index = self.character.sitting
	}
}