var from_team = argument0 //@argument team to select next player on

var base;
var team;

if from_team == playing.player {
	base = global.team_player_index
	team = global.team_player
}else{
	base = global.team_cpu_index
	team = global.team_cpu
}

for( var i = 1; i < 3; i++){
	var this_player = (base + i) % array_length_1d(team)
	var member = team[this_player]
	if (member.constitution > member.drunkenness){
		if (from_team == playing.player){
			global.team_player_index = this_player
			return
		}else{
			global.team_cpu_index = this_player
			return
		}
	}
}