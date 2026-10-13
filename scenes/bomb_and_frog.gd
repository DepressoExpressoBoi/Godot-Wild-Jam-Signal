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


func _on_jimmy_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass # Replace with function body.
