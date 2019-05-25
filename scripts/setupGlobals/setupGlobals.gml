// Global Game State
global.team_player = []
global.team_cpu = []

global.throws_per_turn = 3
global.remaining_throws = 3


enum throw_screen_state {
	throw_input = 0,
	throwing = 1,
	drinking = 2,
	character_swap = 3
}

enum game_state {
	title = 0,
	attract = 1,
	high_score = 2,
	team_select = 3,
	throwing = 4
}

// global input state
global.left = false
global.right = false
global.up = false
global.down = false
global.select = false
global.act = false
