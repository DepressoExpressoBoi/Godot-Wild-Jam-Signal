extends Control

var shape_options = ['moon', 'circle', 'triangle', 'fork4', 'star']
var static_shape_solution

@export var solved = false
@export var shape_solution = []
@export var color_designation = 'purple'
@export var puzzle_type = 'PowerSliders'

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
	static_shape_solution = shape_solution.duplicate()

func create_shape_solution() -> void:
	var shapes_to_pick = randi_range(1,5)
	var shape_options_copy = shape_options.duplicate()
	
	shape_options_copy.shuffle()
	
	for x in shapes_to_pick:
		shape_solution.append(shape_options_copy.pop_back())
		
func check_solution() -> void:
	for shape in shape_options:
		if shape in static_shape_solution and shape_sliders[shape].value == 0:
			return
		elif shape not in static_shape_solution and shape_sliders[shape].value == 1:
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

func _on_slider_moon_drag_ended(value_changed: bool) -> void:
	if value_changed:
		if 'moon' in static_shape_solution and shape_sliders['moon'].value == 1:
			shape_solution.erase('moon')
		elif 'moon' in static_shape_solution and shape_sliders['moon'].value == 0:
			shape_solution.append('moon')
			
		check_solution()
		solved_puzzle_conditions()

func _on_slider_circle_drag_ended(value_changed: bool) -> void:
	if value_changed:
		if 'circle' in static_shape_solution and shape_sliders['circle'].value == 1:
			shape_solution.erase('circle')
		elif 'circle' in static_shape_solution and shape_sliders['circle'].value == 0:
			shape_solution.append('circle')
			
		check_solution()
		solved_puzzle_conditions()

func _on_slider_triangle_drag_ended(value_changed: bool) -> void:
	if value_changed:
		if 'triangle' in static_shape_solution and shape_sliders['triangle'].value == 1:
			shape_solution.erase('triangle')
		elif 'triangle' in static_shape_solution and shape_sliders['triangle'].value == 0:
			shape_solution.append('triangle')
			
		check_solution()
		solved_puzzle_conditions()

func _on_slider_fork_4_drag_ended(value_changed: bool) -> void:
	if value_changed:
		if 'fork4' in static_shape_solution and shape_sliders['fork4'].value == 1:
			shape_solution.erase('fork4')
		elif 'fork4' in static_shape_solution and shape_sliders['fork4'].value == 0:
			shape_solution.append('fork4')
			
		check_solution()
		solved_puzzle_conditions()

func _on_slider_star_drag_ended(value_changed: bool) -> void:
	if value_changed:
		if 'star' in static_shape_solution and shape_sliders['star'].value == 1:
			shape_solution.erase('star')
		elif 'star' in static_shape_solution and shape_sliders['star'].value == 0:
			shape_solution.append('star')
			
		check_solution()
		solved_puzzle_conditions()
