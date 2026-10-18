extends Area2D
#@onready var all_puzzles = [$WireMatch, $PowerSliders, $PowerSliders2, $WireMatch2, $WireMatch3, $PowerSliders3]
@onready var all_puzzles = get_children().filter(func(puzzle): return puzzle.name.begins_with("PUZZLE-"))

var bomb_puzzles = []
var colors = ['red', 'yellow', 'green', 'blue']

@export var puzzle_grown = false
@export var bomb_grown = false
@export var bomb_tweening = false

var grown_puzzle_default_pos

# red, yellow, green, blue
func _ready() -> void:
	var selected_puzzle
	var remaining_puzzles
	for i in 3:
		selected_puzzle = all_puzzles.pick_random()
		all_puzzles.erase(selected_puzzle)
		bomb_puzzles.append(selected_puzzle)
		
	remaining_puzzles = all_puzzles.filter(func(puzzle): return not bomb_puzzles.has(puzzle))
	print(remaining_puzzles)
	for puzzle in remaining_puzzles:
		puzzle.queue_free()
	
	for i in len(bomb_puzzles):
		bomb_puzzles[i].color_designation = colors[i]
		match colors[i]:
			'red':
				bomb_puzzles[i].position = Vector2(-460.0, -400.0)
				if bomb_puzzles[i].puzzle_type == 'WireMatch':
					bomb_puzzles[i].ShapeButtonLeft1DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft1Default').global_position
					bomb_puzzles[i].ShapeButtonLeft2DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft2Default').global_position
					bomb_puzzles[i].ShapeButtonLeft3DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft3Default').global_position
					bomb_puzzles[i].ShapeButtonLeft4DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft4Default').global_position
			'yellow':
				bomb_puzzles[i].position = Vector2(36.0, -400.0)
				if bomb_puzzles[i].puzzle_type == 'WireMatch':
					bomb_puzzles[i].ShapeButtonLeft1DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft1Default').global_position
					bomb_puzzles[i].ShapeButtonLeft2DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft2Default').global_position
					bomb_puzzles[i].ShapeButtonLeft3DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft3Default').global_position
					bomb_puzzles[i].ShapeButtonLeft4DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft4Default').global_position
			'green':
				bomb_puzzles[i].position = Vector2(-460.0, 32.0)
				if bomb_puzzles[i].puzzle_type == 'WireMatch':
					bomb_puzzles[i].ShapeButtonLeft1DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft1Default').global_position
					bomb_puzzles[i].ShapeButtonLeft2DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft2Default').global_position
					bomb_puzzles[i].ShapeButtonLeft3DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft3Default').global_position
					bomb_puzzles[i].ShapeButtonLeft4DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft4Default').global_position
			'blue':
				bomb_puzzles[i].position = Vector2(36.0, 32.0)
				if bomb_puzzles[i].puzzle_type == 'WireMatch':
					bomb_puzzles[i].ShapeButtonLeft1DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft1Default').global_position
					bomb_puzzles[i].ShapeButtonLeft2DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft2Default').global_position
					bomb_puzzles[i].ShapeButtonLeft3DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft3Default').global_position
					bomb_puzzles[i].ShapeButtonLeft4DefaultPos = bomb_puzzles[i].get_node('ShapeButtonLeft4Default').global_position
			'_':
				print('You\'ve fucked up')
				
func grow_puzzle(puzzle) -> Tween:
	var tween = create_tween().set_parallel(true)
	#puzzle.position = Vector2(-460.0, -400.0)
	
	grown_puzzle_default_pos = puzzle.position
	puzzle.get_child(0).visible = true
	if puzzle.color_designation == 'red':
		puzzle.get_child(0).color = Color.from_rgba8(215.0, 23.0, 0.0)
	elif puzzle.color_designation == 'green':
		puzzle.get_child(0).color = Color.from_rgba8(0.0, 216.0, 3.0)
	elif puzzle.color_designation == 'yellow':
		puzzle.get_child(0).color = Color.from_rgba8(215.0, 190.0, 1.0)
	elif puzzle.color_designation == 'blue':
		puzzle.get_child(0).color = Color.from_rgba8(50.0, 1.0, 217.0)
	
	tween.tween_property(puzzle, "scale", Vector2(0.9, 0.9), 0.5)
	tween.tween_property(puzzle, "position", Vector2(-460.0, -440.0), 0.5)
	
	return tween
	
func shrink_puzzle(puzzle) -> Tween:
	var tween = create_tween().set_parallel(true)

	tween.tween_property(puzzle, "scale", Vector2(0.4, 0.4), 0.5)
	tween.tween_property(puzzle, "position", grown_puzzle_default_pos, 0.5)
	
	grown_puzzle_default_pos = Vector2(0.0, 0.0)
	
	return tween

func _on_puzzle_wire_match_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var bomb_tween
		
		if puzzle_grown:
			puzzle_grown = false
			for puzzle in bomb_puzzles:
				if puzzle.puzzle_type == 'WireMatch':
					bomb_tween = shrink_puzzle(puzzle)
			
					await bomb_tween.finished
					
					puzzle.get_child(0).visible = false
					
			for puzzle in bomb_puzzles:
				if puzzle.puzzle_type != 'WireMatch':
					puzzle.visible = true
					
					
		else:
			if bomb_grown or bomb_tweening:
				return
				
			puzzle_grown = true
			for puzzle in bomb_puzzles:
				if puzzle.puzzle_type != 'WireMatch':
					print('puzzle_visibility: ', puzzle, puzzle.visible)
					puzzle.visible = false
			for puzzle in bomb_puzzles:
				if puzzle.puzzle_type == 'WireMatch':
					bomb_tween = grow_puzzle(puzzle)
			
					await bomb_tween.finished

func _on_puzzle_power_sliders_gui_input(event: InputEvent) -> void:
	#print('power_sliders event: ', event)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var bomb_tween
		
		print('powersliders puzzle_grown: ', puzzle_grown)
		
		if puzzle_grown:
			puzzle_grown = false
			for puzzle in bomb_puzzles:
				if puzzle.puzzle_type == 'PowerSliders':
					print('in puzzle_grown powersliders')
					bomb_tween = shrink_puzzle(puzzle)
			
					await bomb_tween.finished
					
					puzzle.get_child(0).visible = false
					
			for puzzle in bomb_puzzles:
				if puzzle.puzzle_type != 'PowerSliders':
					puzzle.visible = true
					
					
		else:
			if bomb_grown or bomb_tweening:
				return
				
			puzzle_grown = true
			for puzzle in bomb_puzzles:
				if puzzle.puzzle_type != 'PowerSliders':
					print('puzzle_visibility: ', puzzle, puzzle.visible)
					puzzle.visible = false
			for puzzle in bomb_puzzles:
				if puzzle.puzzle_type == 'PowerSliders':
					bomb_tween = grow_puzzle(puzzle)
					
		print('powersliders puzzle_grown: ', puzzle_grown)


func _on_puzzle_simon_says_gui_input(event: InputEvent) -> void:
	#print('power_sliders event: ', event)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var bomb_tween
		
		print('SimonSays puzzle_grown: ', puzzle_grown)
		
		if puzzle_grown:
			puzzle_grown = false
			for puzzle in bomb_puzzles:
				if puzzle.puzzle_type == 'SimonSays':
					print('in puzzle_grown SimonSays')
					bomb_tween = shrink_puzzle(puzzle)
			
					await bomb_tween.finished
					
					puzzle.get_child(0).visible = false
					
			for puzzle in bomb_puzzles:
				if puzzle.puzzle_type != 'SimonSays':
					puzzle.visible = true
					
					
		else:
			if bomb_grown or bomb_tweening:
				return
				
			puzzle_grown = true
			for puzzle in bomb_puzzles:
				if puzzle.puzzle_type != 'SimonSays':
					print('puzzle_visibility: ', puzzle, puzzle.visible)
					puzzle.visible = false
			for puzzle in bomb_puzzles:
				if puzzle.puzzle_type == 'SimonSays':
					bomb_tween = grow_puzzle(puzzle)
					
		print('SimonSays puzzle_grown: ', puzzle_grown)
