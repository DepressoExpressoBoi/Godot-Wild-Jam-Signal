extends Control

var shape_options = ['moon', 'circle', 'triangle', 'fork3', 'fork4', 'star', 'heart', 'square']
var static_shape_solution

var left_button1_selected = false
var left_button2_selected = false
var left_button3_selected = false
var left_button4_selected = false
var left_button_selected = false
var wire1connected = false
var wire2connected = false
var wire3connected = false
var wire4connected = false

@export var solved = false
@export var shape_solution = []
@export var color_designation = 'yellow'

@onready var ShapeButtonLeft1 = $ShapeButtonLeft1
@onready var ShapeButtonLeft2 = $ShapeButtonLeft2
@onready var ShapeButtonLeft3 = $ShapeButtonLeft3
@onready var ShapeButtonLeft4 = $ShapeButtonLeft4
@onready var ShapeButtonRight1 = $ShapeButtonRight1
@onready var ShapeButtonRight2 = $ShapeButtonRight2
@onready var ShapeButtonRight3 = $ShapeButtonRight3
@onready var ShapeButtonRight4 = $ShapeButtonRight4

@onready var Wire1 = $Wire1
@onready var Wire2 = $Wire2
@onready var Wire3 = $Wire3
@onready var Wire4 = $Wire4

#@onready var shape_buttons = [ShapeButtonLeft1, ShapeButtonLeft2, ShapeButtonLeft3, ShapeButtonLeft4, ShapeButtonRight1, ShapeButtonRight2, ShapeButtonRight3, ShapeButtonRight4]
# Note for tomorrow Said, I figured out the issue it has to do with global and local positioning of node elemets. That means you can make it draggable.
# My current idea is to remove the rightshapebuttons and make them area2ds. Then when leftbutton is up, check if they've entered the area
# and if so then leave button connected, otherwise return to original position. This will also help with disconnecting and reconnecting wires.
# Mifht have to consider edge case of trying to connect to an end that already has a wire. 

func _ready() -> void:
	create_shape_solution()
	static_shape_solution = shape_solution.duplicate()
	assign_shape_to_buttons()
	print(shape_solution)
	#for shape_button in shape_buttons:
		#print(shape_button.shape)
		
func create_shape_solution() -> void:
	var shape_options_copy = shape_options.duplicate()
	var left_shape
	var right_shape
	
	shape_options_copy.shuffle()
	
	for i in 4:
		left_shape = shape_options_copy.pick_random()
		shape_options_copy.erase(left_shape)
		right_shape = shape_options_copy.pick_random()
		shape_options_copy.erase(right_shape)
		
		shape_solution.append([left_shape, right_shape])
	
func assign_shape_to_buttons() -> void:
	var left_shape_buttons = [ShapeButtonLeft1, ShapeButtonLeft2, ShapeButtonLeft3, ShapeButtonLeft4]
	var right_shape_buttons = [ShapeButtonRight1, ShapeButtonRight2, ShapeButtonRight3, ShapeButtonRight4]
	var left_shapes = []
	var right_shapes = []
	var left_shape
	var right_shape
	
	for shapes in shape_solution:
		left_shapes.append(shapes[0])
		right_shapes.append(shapes[1])
		
	for i in 4:
		left_shape = left_shapes.pick_random()
		left_shapes.erase(left_shape)
		right_shape = right_shapes.pick_random()
		right_shapes.erase(right_shape)
		
		left_shape_buttons[i].shape = left_shape
		right_shape_buttons[i].shape = right_shape

func _on_shape_button_left_1_pressed() -> void:
	if not left_button_selected and not wire1connected:
		left_button_selected = true
		left_button1_selected = true
		print(ShapeButtonLeft1.shape)
	elif left_button_selected and not wire1connected:
		left_button_selected = false
		left_button1_selected = false
		print('deselected wire 1')

func _on_shape_button_left_2_pressed() -> void:
	if not left_button_selected and not wire2connected:
		left_button_selected = true
		left_button2_selected = true
		print(ShapeButtonLeft2.shape)
	elif left_button_selected and not wire2connected:
		left_button_selected = false
		left_button2_selected = false
		print('deselected wire 2')

func _on_shape_button_left_3_pressed() -> void:
	if not left_button_selected and not wire3connected:
		left_button_selected = true
		left_button3_selected = true
		print(ShapeButtonLeft3.shape)
	elif left_button_selected and not wire3connected:
		left_button_selected = false
		left_button3_selected = false
		print('deselected wire 3')

func _on_shape_button_left_4_pressed() -> void:
	if not left_button_selected and not wire4connected:
		left_button_selected = true
		left_button4_selected = true
		print(ShapeButtonLeft4.shape)
	elif left_button_selected and not wire4connected:
		left_button_selected = false
		left_button4_selected = false
		print('deselected wire 4')

func _on_shape_button_right_1_pressed() -> void:
	if left_button_selected and not wire1connected and not wire2connected and not wire3connected and not wire4connected:
		if left_button1_selected:
			wire1connected = true
			Wire1.clear_points()
			# Fixed code to draw line from the center of the buttons
			# (ShapeButtonLeft1.size * 0.5 * ShapeButtonLeft1.global_scale)
			Wire1.add_point(Wire1.to_local(ShapeButtonLeft1.global_position))
			Wire1.add_point(Wire1.to_local(ShapeButtonRight1.global_position))
			print(ShapeButtonLeft1.global_position)
			print(Wire1.to_local(ShapeButtonLeft1.global_position))
			print(ShapeButtonRight1.global_position)
			print(Wire1.to_local(ShapeButtonRight1.global_position))
		elif left_button2_selected:
			wire2connected = true
			Wire1.clear_points()
			Wire1.add_point(ShapeButtonLeft2.global_position * 0.075)
			Wire1.add_point(ShapeButtonRight1.global_position * 0.075)
		elif left_button3_selected:
			wire3connected = true
			Wire1.clear_points()
			Wire1.add_point(ShapeButtonLeft3.global_position * 0.075)
			Wire1.add_point(ShapeButtonRight1.global_position * 0.075)
		elif left_button4_selected:
			wire4connected = true
			Wire1.clear_points()
			Wire1.add_point(ShapeButtonLeft4.global_position * 0.075)
			Wire1.add_point(ShapeButtonRight1.global_position * 0.075)

func _on_shape_button_right_2_pressed() -> void:
	if left_button_selected and not wire1connected and not wire2connected and not wire3connected and not wire4connected:
		if left_button1_selected:
			wire1connected = true
			Wire1.clear_points()
			Wire1.add_point(ShapeButtonLeft1.global_position * 0.075)
			Wire1.add_point(ShapeButtonRight2.global_position * 0.075)
		elif left_button2_selected:
			wire2connected = true
			Wire1.clear_points()
			Wire1.add_point(ShapeButtonLeft2.global_position * 0.075)
			Wire1.add_point(ShapeButtonRight2.global_position * 0.075)
		elif left_button3_selected:
			wire3connected = true
			Wire1.clear_points()
			Wire1.add_point(ShapeButtonLeft3.global_position * 0.075)
			Wire1.add_point(ShapeButtonRight2.global_position * 0.075)
		elif left_button4_selected:
			wire4connected = true
			Wire1.clear_points()
			Wire1.add_point(ShapeButtonLeft4.global_position * 0.075)
			Wire1.add_point(ShapeButtonRight2.global_position * 0.075)

func _on_shape_button_right_3_pressed() -> void:
	if left_button_selected and not wire1connected and not wire2connected and not wire3connected and not wire4connected:
		if left_button1_selected:
			wire1connected = true
			Wire1.clear_points()
			Wire1.add_point(ShapeButtonLeft1.global_position * 0.075)
			Wire1.add_point(ShapeButtonRight3.global_position * 0.075)
		elif left_button2_selected:
			wire2connected = true
			Wire1.clear_points()
			Wire1.add_point(ShapeButtonLeft2.global_position * 0.075)
			Wire1.add_point(ShapeButtonRight3.global_position * 0.075)
		elif left_button3_selected:
			wire3connected = true
			Wire1.clear_points()
			Wire1.add_point(ShapeButtonLeft3.global_position * 0.075)
			Wire1.add_point(ShapeButtonRight3.global_position * 0.075)
		elif left_button4_selected:
			wire4connected = true
			Wire1.clear_points()
			Wire1.add_point(ShapeButtonLeft4.global_position * 0.075)
			Wire1.add_point(ShapeButtonRight3.global_position * 0.075)

func _on_shape_button_right_4_pressed() -> void:
	if left_button_selected and not wire1connected and not wire2connected and not wire3connected and not wire4connected:
		if left_button1_selected:
			wire1connected = true
			Wire1.clear_points()
			Wire1.add_point(ShapeButtonLeft1.global_position * 0.075)
			Wire1.add_point(ShapeButtonRight4.global_position * 0.075)
		elif left_button2_selected:
			wire2connected = true
			Wire1.clear_points()
			Wire1.add_point(ShapeButtonLeft2.global_position * 0.075)
			Wire1.add_point(ShapeButtonRight4.global_position * 0.075)
		elif left_button3_selected:
			wire3connected = true
			Wire1.clear_points()
			Wire1.add_point(ShapeButtonLeft3.global_position * 0.075)
			Wire1.add_point(ShapeButtonRight4.global_position * 0.075)
		elif left_button4_selected:
			wire4connected = true
			Wire1.clear_points()
			Wire1.add_point(ShapeButtonLeft4.global_position * 0.075)
			Wire1.add_point(ShapeButtonRight4.global_position * 0.075)
