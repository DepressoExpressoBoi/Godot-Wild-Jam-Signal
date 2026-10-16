extends Sprite2D
@onready var all_puzzles = [$WireMatch, $PowerSliders, $PuzzleA, $PuzzleA2, $PuzzleA3, $PuzzleA4]
var bomb_puzzles = []

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
	
	
