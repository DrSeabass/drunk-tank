// Global Game State
global.team_player = []
global.team_cpu = []

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
	character_swap = 5
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
global.screenstate = throw_screen_state.throw_input

// global input state
global.left = false
global.right = false
global.up = false
global.down = false
global.select = false
global.act = false
