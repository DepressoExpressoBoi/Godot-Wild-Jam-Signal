extends Node2D

@onready var Bomb = $Bomb
@onready var Jimmy = $Jimmy

# adding timer funcionality, t.c.
@onready var label = $timerLabel
@onready var timer = $Timer

var puzzles
var puzzle_solutions = {}
var jimmy_clues

# Variables needed for specific puzzles (i.e. the wire match any future puzzle)
var wire_match_clue_selected = false
var wire_match_clue

var grown_bomb_default_pos

# code to change jimmy animations, you're going to have to switch back to default afterwards
# Jimmy.play("purple_circle")

func _ready() -> void:
	# adding timer to the ready func, t.c.
	timer.start()
	
	puzzles = Bomb.get_children().filter(func(puzzle): return puzzle.name.begins_with("PUZZLE-"))
		
	for puzzle in puzzles:
		puzzle_solutions.set(puzzle.color_designation, [puzzle, puzzle.puzzle_type, puzzle.shape_solution])
	
func time_left_to_live():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]
	
func _process(delta):
	label.text = "%02d : %02d" % time_left_to_live()
	
func choose_puzzle_clue(random_puzzle_color) -> String:
	var puzzle = puzzle_solutions[random_puzzle_color][0]
	var puzzle_type = puzzle_solutions[random_puzzle_color][1]
	var clue_shape = 'fake-shape'
	
	match puzzle_type:
		'WireMatch':
				if wire_match_clue_selected:
					if not puzzle.solved:
						wire_match_clue_selected = false
						clue_shape = wire_match_clue.pop_front()
						wire_match_clue.push_back(clue_shape)
						
						wire_match_clue.clear()
					print('wire_match_clue_selected: ', clue_shape)
					return clue_shape
				else:
					if not puzzle.solved:
						wire_match_clue_selected = true
						wire_match_clue = puzzle_solutions[random_puzzle_color][2].duplicate().pick_random().duplicate()
						
						clue_shape = wire_match_clue.pop_front()
						wire_match_clue.push_back(clue_shape)
					print('not wire_match_clue_selected: ', clue_shape)
					return clue_shape
		'PowerSliders':
			if not puzzle.solved:
				clue_shape = puzzle_solutions[random_puzzle_color][2].pick_random()
			return clue_shape
		_:
			print('You fucked up in choose_puzzle_clue!')
			return 'failure'
			
func display_clue(random_puzzle_color, random_puzzle_shape):
	var puzzle = puzzle_solutions[random_puzzle_color][0]
	
	if not puzzle.solved:
		if random_puzzle_shape != 'powerslide' or random_puzzle_shape != 'fake-shape':
			print('not puzzle.solved: ', random_puzzle_shape)
			Jimmy.monitoring = false
			Jimmy.animation.play(random_puzzle_color + '_' + random_puzzle_shape)
	elif puzzle.solved:
		Jimmy.monitoring = false
		Jimmy.animation.play('hurry_up')
		
func grow_bomb() -> Tween:
	var tween = create_tween().set_parallel(true)
	
	grown_bomb_default_pos = Bomb.position
	
	tween.tween_property(Bomb, "scale", Vector2(0.5, 0.5), 0.5)
	tween.tween_property(Bomb, "position", grown_bomb_default_pos + Vector2(-100.0, 50.0), 0.5)
	
	return tween
	
func shrink_bomb() -> Tween:
	var tween = create_tween().set_parallel(true)
	
	tween.tween_property(Bomb, "scale", Vector2(0.25, 0.25), 0.5)
	tween.tween_property(Bomb, "position", grown_bomb_default_pos, 0.5)
	
	grown_bomb_default_pos = Vector2(0.0, 0.0)
	
	return tween

# This function will play the animation for one the random clues for all the puzzles. Currently it only does the purple
# puzzle clues. It checks the puzzles individual copy of their shape_solution array for the clue to give. The PowerSLide
# puzzle currently doesn't remove for correct answers, and maybe it shouldn't? But for other puzzles and that one it can be
# more dynamic and if it sees less clues in the original then it will have less.
func _on_jimmy_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		puzzles = Bomb.get_children().filter(func(puzzle): return puzzle.name.begins_with("PUZZLE-"))
		
		for puzzle in puzzles:
			puzzle_solutions.set(puzzle.color_designation, [puzzle, puzzle.puzzle_type, puzzle.shape_solution])
		print(puzzle_solutions)
		
		 #Pick a random puzzle to give clue for
		var random_puzzle_color = puzzle_solutions.keys().pick_random()
		var random_puzzle_shape
		
		# Pick clue from each puzzle differently, as some you want to be sequential	
		match random_puzzle_color:
			'red':
				random_puzzle_shape = choose_puzzle_clue(random_puzzle_color)
				# For power slider puzzle, pick the clue randomly
				#random_puzzle_clue = puzzle_solutions[random_puzzle].pick_random()
			'yellow':
				random_puzzle_shape = choose_puzzle_clue(random_puzzle_color)
				# For power slider puzzle, pick the clue randomly
				#random_puzzle_clue = puzzle_solutions[random_puzzle].pick_random()
			'blue':
				random_puzzle_shape = choose_puzzle_clue(random_puzzle_color)
				# For power slider puzzle, pick the clue randomly
				#random_puzzle_clue = puzzle_solutions[random_puzzle].pick_random()
			'green':
				random_puzzle_shape = choose_puzzle_clue(random_puzzle_color)
				# For power slider puzzle, pick the clue randomly
				#random_puzzle_clue = puzzle_solutions[random_puzzle].pick_random()
			_:
				print('You fucked up in Jimmy event!')
				
		print(random_puzzle_color + '_' + random_puzzle_shape)
		display_clue(random_puzzle_color, random_puzzle_shape)
		#
		#if len(puzzle_solutions[random_puzzle]) > 0:
			#Jimmy.animation.play(random_puzzle + '_' + random_puzzle_clue)
		#else:
			#print('Can\'t animate clue')

func _on_bomb_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		var bomb_tween
		
		Bomb.bomb_tweening = true
		
		if Bomb.bomb_grown:
			Bomb.bomb_grown = false
			bomb_tween = shrink_bomb()
			
			await bomb_tween.finished
		else:
			Bomb.bomb_grown = true
			bomb_tween = grow_bomb()
			
			await bomb_tween.finished
			
		Bomb.bomb_tweening = false
			
		for puzzle in puzzles:
			if puzzle.puzzle_type == 'WireMatch':
				puzzle.ShapeButtonLeft1DefaultPos = puzzle.get_node('ShapeButtonLeft1Default').global_position
				puzzle.ShapeButtonLeft2DefaultPos = puzzle.get_node('ShapeButtonLeft2Default').global_position
				puzzle.ShapeButtonLeft3DefaultPos = puzzle.get_node('ShapeButtonLeft3Default').global_position
				puzzle.ShapeButtonLeft4DefaultPos = puzzle.get_node('ShapeButtonLeft4Default').global_position

func _on_timer_timeout() -> void:
	print('game_over')
