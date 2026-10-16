extends Sprite2D
@onready var all_puzzles = [$WireMatch, $PowerSliders, $PowerSliders2, $WireMatch2, $WireMatch3, $PowerSliders3]
var bomb_puzzles = []
var colors = ['red', 'yellow', 'green', 'blue']

# red, yellow, green, blue
func _ready() -> void:
	var selected_puzzle
	var remaining_puzzles
	for i in 4:
		selected_puzzle = all_puzzles.pick_random()
		all_puzzles.erase(selected_puzzle)
		bomb_puzzles.append(selected_puzzle)
		
	remaining_puzzles = all_puzzles.filter(func(puzzle): return not bomb_puzzles.has(puzzle))
	
	for puzzle in remaining_puzzles:
		puzzle.queue_free()
	
	for i in 4:
		bomb_puzzles[i].color_designation = colors[i]
		match colors[i]:
			'red':
				bomb_puzzles[i].position = Vector2(-460.0, -400.0)
			'yellow':
				bomb_puzzles[i].position = Vector2(36.0, -400.0)
			'green':
				bomb_puzzles[i].position = Vector2(-460.0, 32.0)
			'blue':
				bomb_puzzles[i].position = Vector2(36.0, 32.0)
			'_':
				print('You\'ve fucked up')
