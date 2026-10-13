extends Control

var shape_options = ['moon', 'circle', 'triangle', 'fork4', 'star']

@export var solved = false
@export var shape_solution = []
@export var color_designation = 'purple'

@onready var SliderMoon = $SliderMoon
@onready var SliderCircle = $SliderCircle
@onready var SliderTriangle = $SliderTriangle
@onready var SliderFork4 = $SliderFork4
@onready var SliderStar = $SliderStar

@onready var shape_sliders = {
	'moon': SliderMoon,
	'circle': SliderCircle,
	'triangle': SliderTriangle,
	'fork4': SliderFork4,
	'star': SliderStar
}

func _ready() -> void:
	create_shape_solution()
	print(shape_solution)

func create_shape_solution() -> void:
	var shapes_to_pick = randi_range(1,5)
	var shape_options_copy = shape_options.duplicate()
	
	shape_options_copy.shuffle()
	
	for x in shapes_to_pick:
		shape_solution.append(shape_options_copy.pop_back())
		
func check_solution() -> void:
	for shape in shape_options:
		if shape in shape_solution and shape_sliders[shape].value == 0:
			return
		elif shape not in shape_solution and shape_sliders[shape].value == 1:
			return
	
	solved = true
	
func solved_puzzle_conditions() -> void:
	# Will have to eventually add code to turn on a light on the bomb to show puzzle is solved as well and to the frog.
	if solved == true:
		SliderMoon.set_editable(false)
		SliderCircle.set_editable(false) 
		SliderTriangle.set_editable(false) 
		SliderFork4.set_editable(false) 
		SliderStar.set_editable(false)

func _on_slider_moon_value_changed(value: float) -> void:
	check_solution()
	solved_puzzle_conditions()

func _on_slider_circle_value_changed(value: float) -> void:
	check_solution()
	solved_puzzle_conditions()

func _on_slider_triangle_value_changed(value: float) -> void:
	check_solution()
	solved_puzzle_conditions()

func _on_slider_fork_4_value_changed(value: float) -> void:
	check_solution()
	solved_puzzle_conditions()
	
func _on_slider_star_value_changed(value: float) -> void:
	check_solution()
	solved_puzzle_conditions()
