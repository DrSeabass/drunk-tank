draw_set_font(fntGameText)
var throw_text = "Throwing: "
if (global.player == playing.player){
	throw_text += global.team_player[global.team_player_index].name
}else{
	throw_text += global.team_cpu[global.team_cpu_index].name
}
draw_text(self.x, self.y, throw_text)