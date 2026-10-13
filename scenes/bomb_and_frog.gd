extends Node2D

@onready var Bomb = $Bomb
@onready var Jimmy = $Jimmy

@onready var puzzles = Bomb.get_children()
var puzzle_solutions = {}

# code to change jimmy animations, you're going to have to switch back to default afterwards
# Jimmy.play("purple_circle")

func _ready() -> void:
	for puzzle in puzzles:
		#print(puzzle)
		puzzle_solutions.set(puzzle.color_designation, puzzle.shape_solution)

	print(puzzle_solutions)

# This function will play the animation for one the random clues for all the puzzles. Currently it only does the purple
# puzzle clues. It checks the puzzles individual copy of their shape_solution array for the clue to give. The PowerSLide
# puzzle currently doesn't remove for correct answers, and maybe it shouldn't? But for other puzzles and that one it can be
# more dynamic and if it sees less clues in the original then it will have less.
func _on_jimmy_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		var random_puzzle = puzzle_solutions.keys().pick_random()
		var random_puzzle_clue = puzzle_solutions[random_puzzle].pick_random()
		
		print(random_puzzle + '_' + random_puzzle_clue)
		
		Jimmy.animation.play(random_puzzle + '_' + random_puzzle_clue)
	
