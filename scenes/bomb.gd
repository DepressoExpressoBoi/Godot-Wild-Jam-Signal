extends Area2D
#@onready var all_puzzles = [$WireMatch, $PowerSliders, $PowerSliders2, $WireMatch2, $WireMatch3, $PowerSliders3]
@onready var all_puzzles = get_children().filter(func(puzzle): return puzzle.name.begins_with("PUZZLE-"))
var bomb_puzzles = []
var colors = ['red', 'yellow', 'green', 'blue']

# red, yellow, green, blue
func _ready() -> void:
	var selected_puzzle
	var remaining_puzzles
	for i in 2:
		selected_puzzle = all_puzzles.pick_random()
		all_puzzles.erase(selected_puzzle)
		bomb_puzzles.append(selected_puzzle)
		
	remaining_puzzles = all_puzzles.filter(func(puzzle): return not bomb_puzzles.has(puzzle))
	print(remaining_puzzles)
	for puzzle in remaining_puzzles:
		puzzle.queue_free()
	
	reposition_buttons()

func reposition_buttons() -> void:
	for i in 2:
		bomb_puzzles[i].color_designation = colors[i]
		match colors[i]:
			'red':
				bomb_puzzles[i].position = Vector2(-460.0, -400.0)
				if bomb_puzzles[i].puzzle_type == 'WireMatch':
					bomb_puzzles[i].ShapeButtonLeft1DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft1').global_position
					bomb_puzzles[i].ShapeButtonLeft2DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft2').global_position
					bomb_puzzles[i].ShapeButtonLeft3DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft3').global_position
					bomb_puzzles[i].ShapeButtonLeft4DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft4').global_position
			'yellow':
				bomb_puzzles[i].position = Vector2(36.0, -400.0)
				if bomb_puzzles[i].puzzle_type == 'WireMatch':
					bomb_puzzles[i].ShapeButtonLeft1DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft1').global_position
					bomb_puzzles[i].ShapeButtonLeft2DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft2').global_position
					bomb_puzzles[i].ShapeButtonLeft3DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft3').global_position
					bomb_puzzles[i].ShapeButtonLeft4DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft4').global_position
			'green':
				bomb_puzzles[i].position = Vector2(-460.0, 32.0)
				if bomb_puzzles[i].puzzle_type == 'WireMatch':
					bomb_puzzles[i].ShapeButtonLeft1DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft1').global_position
					bomb_puzzles[i].ShapeButtonLeft2DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft2').global_position
					bomb_puzzles[i].ShapeButtonLeft3DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft3').global_position
					bomb_puzzles[i].ShapeButtonLeft4DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft4').global_position
			'blue':
				bomb_puzzles[i].position = Vector2(36.0, 32.0)
				if bomb_puzzles[i].puzzle_type == 'WireMatch':
					bomb_puzzles[i].ShapeButtonLeft1DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft1').global_position
					bomb_puzzles[i].ShapeButtonLeft2DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft2').global_position
					bomb_puzzles[i].ShapeButtonLeft3DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft3').global_position
					bomb_puzzles[i].ShapeButtonLeft4DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft4').global_position
			'_':
				print('You\'ve fucked up')
