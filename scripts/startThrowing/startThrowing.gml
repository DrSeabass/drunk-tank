var pcIndex = 0
var cpuIndex = 0
var mleng = array_length_1d(global.all_players)

for (playerIndex = 0; playerIndex < mleng; playerIndex++){
	var teamMember = global.all_players[playerIndex]
	teamMember.visible = false
	if teamMember.selected{
		global.team_player[pcIndex] = teamMember
		pcIndex++
	}else if cpuIndex < 3 {
		global.team_cpu[cpuIndex] = teamMember
		cpuIndex++
	}
}

room_goto(rThrow)