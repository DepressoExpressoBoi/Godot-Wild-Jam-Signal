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

# code to change jimmy animations, you're going to have to switch back to default afterwards
# Jimmy.play("purple_circle")

func _ready() -> void:
	# adding timer to the ready func, t.c.
	timer.start()
	
func time_left_to_live():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]
	
func _process(delta):
	label.text = "%02d : %02d" % time_left_to_live()
	
func choose_puzzle_clue(random_puzzle_color):
	var puzzle_type = puzzle_solutions[random_puzzle_color][0]
	var clue_shape
	
	match puzzle_type:
		'WireMatch':
				if wire_match_clue_selected:
					wire_match_clue_selected = false
					clue_shape = wire_match_clue.pop_back()
					wire_match_clue.push_front(clue_shape)
					
					wire_match_clue.clear()
					return clue_shape
				else:
					wire_match_clue_selected = true
					wire_match_clue = puzzle_solutions[random_puzzle_color][1].duplicate().pick_random()
					
					clue_shape = wire_match_clue.pop_back()
					wire_match_clue.push_front(clue_shape)
					return clue_shape
		'PowerSliders':
			return 'powerslide'
		_:
			print('You fucked up in choose_puzzle_clue!')

# This function will play the animation for one the random clues for all the puzzles. Currently it only does the purple
# puzzle clues. It checks the puzzles individual copy of their shape_solution array for the clue to give. The PowerSLide
# puzzle currently doesn't remove for correct answers, and maybe it shouldn't? But for other puzzles and that one it can be
# more dynamic and if it sees less clues in the original then it will have less.
func _on_jimmy_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		puzzles = Bomb.get_children()
		
		for puzzle in puzzles:
			puzzle_solutions.set(puzzle.color_designation, [puzzle.puzzle_type, puzzle.shape_solution])
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
		#
		#if len(puzzle_solutions[random_puzzle]) > 0:
			#Jimmy.animation.play(random_puzzle + '_' + random_puzzle_clue)
		#else:
			#print('Can\'t animate clue')
	
