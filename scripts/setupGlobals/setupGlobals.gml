// Global Game State
global.offscreen = -1000

// set up players
global.team_player = []
global.team_cpu = []

global.team_player[0] = instance_create_depth(global.offscreen, global.offscreen, global.offscreen, objPlayer);
global.team_player[1] = instance_create_depth(global.offscreen, global.offscreen, global.offscreen, objPlayer);
global.team_player[2] = instance_create_depth(global.offscreen, global.offscreen, global.offscreen, objPlayer);
global.team_player[0].name = "PC 0"
global.team_player[1].name = "PC 1"
global.team_player[2].name = "PC 2"

global.team_cpu[0] = instance_create_depth(global.offscreen, global.offscreen, global.offscreen, objPlayer);
global.team_cpu[1] = instance_create_depth(global.offscreen, global.offscreen, global.offscreen, objPlayer);
global.team_cpu[2] = instance_create_depth(global.offscreen, global.offscreen, global.offscreen, objPlayer);
global.team_cpu[0].name = "CPU 0"
global.team_cpu[1].name = "CPU 1"
global.team_cpu[2].name = "CPU 2"
show_debug_message("created_teams")

global.team_player_index = 0
global.team_cpu_index = 0
global.throws_per_turn = 3
global.remaining_throws = 3

enum playing {
	cpu = 0,
	player = 1
}

global.player = playing.player

enum throw_screen_state {
	throw_input = 0,
	throwing = 1,
	ball_in_flight = 2,
	plunging = 3,
	drinking = 4,
	character_swap = 5,
	start_throw = 6
}

enum game_state {
	title = 0,
	attract = 1,
	high_score = 2,
	team_select = 3,
	throwing = 4
}

// Game state machine
global.gamestate = game_state.throwing
global.screenstate = throw_screen_state.start_throw

// global input state
global.left = false
global.right = false
global.up = false
global.down = false
global.select = false
global.act = false
