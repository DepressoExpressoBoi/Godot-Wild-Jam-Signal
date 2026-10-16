extends Control

var shape_options = ['moon', 'circle', 'triangle', 'fork3', 'fork4', 'star', 'heart', 'square']
var static_shape_solution

var left_button1_selected = false
var left_button2_selected = false
var left_button3_selected = false
var left_button4_selected = false

var wire1connected = false
var wire2connected = false
var wire3connected = false
var wire4connected = false

var right_area1_entered = false
var right_area2_entered = false
var right_area3_entered = false
var right_area4_entered = false

var wire1_shape_connection = []
var wire2_shape_connection = []
var wire3_shape_connection = []
var wire4_shape_connection = []

@export var solved = false
@export var shape_solution = []
@export var color_designation = 'yellow'
@export var puzzle_type = 'WireMatch'

@onready var ShapeButtonLeft1 = $ShapeButtonLeft1
@onready var ShapeButtonLeft2 = $ShapeButtonLeft2
@onready var ShapeButtonLeft3 = $ShapeButtonLeft3
@onready var ShapeButtonLeft4 = $ShapeButtonLeft4
@onready var ShapeConnectorRight1 = $ShapeConnectorRight1
@onready var ShapeConnectorRight2 = $ShapeConnectorRight2
@onready var ShapeConnectorRight3 = $ShapeConnectorRight3
@onready var ShapeConnectorRight4 = $ShapeConnectorRight4
@onready var Wire1 = $Wire1
@onready var Wire2 = $Wire2
@onready var Wire3 = $Wire3
@onready var Wire4 = $Wire4

@export var ShapeButtonLeft1DefaultPos : Vector2
@export var ShapeButtonLeft2DefaultPos : Vector2
@export var ShapeButtonLeft3DefaultPos : Vector2
@export var ShapeButtonLeft4DefaultPos : Vector2


func _ready() -> void:
	create_shape_solution()
	static_shape_solution = shape_solution.duplicate()
	assign_shape_to_buttons()
	print(shape_solution)
	
	Wire1.default_color = Color(randf(), randf(), randf())
	Wire2.default_color = Color(randf(), randf(), randf())
	Wire3.default_color = Color(randf(), randf(), randf())
	Wire4.default_color = Color(randf(), randf(), randf())
		
func _process(delta):
	follow_mouse()
		
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
	#var right_shape_buttons = [ShapeButtonRight1, ShapeButtonRight2, ShapeButtonRight3, ShapeButtonRight4]
	var right_shape_connectors = [ShapeConnectorRight1, ShapeConnectorRight2, ShapeConnectorRight3, ShapeConnectorRight4]
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
		right_shape_connectors[i].shape = right_shape
		
func check_solution() -> void:	
	var temp_shape_solution = [wire1_shape_connection, wire2_shape_connection, wire3_shape_connection, wire4_shape_connection]
	var difference = static_shape_solution.filter(func(connection): return not temp_shape_solution.has(connection))
	
	shape_solution = difference
	if len(shape_solution) == 0:
		solved = true

func solved_puzzle_conditions() -> void:
	if solved == true:
		ShapeButtonLeft1.disabled = true
		ShapeButtonLeft2.disabled = true
		ShapeButtonLeft3.disabled = true
		ShapeButtonLeft4.disabled = true
		
func follow_mouse() -> void:
	if left_button1_selected:
		var offset = (ShapeButtonLeft1.size * 0.5 * ShapeButtonLeft1.get_global_transform().get_scale())
		ShapeButtonLeft1.global_position = get_global_mouse_position()
		Wire1.clear_points()
		Wire1.add_point(Wire1.to_local(ShapeButtonLeft1DefaultPos + offset - Vector2(offset.x, 0)))
		Wire1.add_point(Wire1.to_local(get_global_mouse_position()))
	elif left_button2_selected:
		var offset = (ShapeButtonLeft2.size * 0.5 * ShapeButtonLeft1.get_global_transform().get_scale())
		ShapeButtonLeft2.global_position = get_global_mouse_position()
		Wire2.clear_points()
		Wire2.add_point(Wire2.to_local(ShapeButtonLeft2DefaultPos + offset - Vector2(offset.x, 0)))
		Wire2.add_point(Wire2.to_local(get_global_mouse_position()))
	elif left_button3_selected:
		var offset = (ShapeButtonLeft3.size * 0.5 * ShapeButtonLeft1.get_global_transform().get_scale())
		ShapeButtonLeft3.global_position = get_global_mouse_position()
		Wire3.clear_points()
		Wire3.add_point(Wire3.to_local(ShapeButtonLeft3DefaultPos + offset - Vector2(offset.x, 0)))
		Wire3.add_point(Wire3.to_local(get_global_mouse_position()))
	elif left_button4_selected:
		var offset = (ShapeButtonLeft4.size * 0.5 * ShapeButtonLeft1.get_global_transform().get_scale())
		ShapeButtonLeft4.global_position = get_global_mouse_position()
		Wire4.clear_points()
		Wire4.add_point(Wire4.to_local(ShapeButtonLeft4DefaultPos + offset - Vector2(offset.x, 0)))
		Wire4.add_point(Wire4.to_local(get_global_mouse_position()))
		
func check_wire_connection(shape_connector) -> void:
	if left_button1_selected:
		if wire1connected:
			wire1connected = false
			ShapeButtonLeft1.global_position = ShapeButtonLeft1DefaultPos
			Wire1.clear_points()
			wire1_shape_connection.clear()
		else:
			var offset = (ShapeButtonLeft1.size * 0.5 * ShapeButtonLeft1.get_global_transform().get_scale())
			var connector_collision_shape = shape_connector.get_node('CollisionShape2D')
			wire1connected = true
			ShapeButtonLeft1.global_position = shape_connector.global_position - (connector_collision_shape.shape.size * 0.5 * connector_collision_shape.global_scale)
			Wire1.clear_points()
			Wire1.add_point(Wire1.to_local(ShapeButtonLeft1DefaultPos + offset - Vector2(offset.x, 0)))
			Wire1.add_point(Wire1.to_local(shape_connector.global_position))
			
			wire1_shape_connection.append(ShapeButtonLeft1.shape)
			wire1_shape_connection.append(shape_connector.shape)
			
			check_solution()
			solved_puzzle_conditions()
	elif left_button2_selected:
		if wire2connected:
			wire2connected = false
			ShapeButtonLeft2.global_position = ShapeButtonLeft2DefaultPos
			Wire2.clear_points()
			wire2_shape_connection.clear()
		else:
			var offset = (ShapeButtonLeft2.size * 0.5 * ShapeButtonLeft2.get_global_transform().get_scale())
			var connector_collision_shape = shape_connector.get_node('CollisionShape2D')
			wire2connected = true
			ShapeButtonLeft2.global_position = shape_connector.global_position - (connector_collision_shape.shape.size * 0.5 * connector_collision_shape.global_scale)
			Wire2.clear_points()
			Wire2.add_point(Wire2.to_local(ShapeButtonLeft2DefaultPos + offset - Vector2(offset.x, 0)))
			Wire2.add_point(Wire2.to_local(shape_connector.global_position))
			
			wire2_shape_connection.append(ShapeButtonLeft2.shape)
			wire2_shape_connection.append(shape_connector.shape)
			
			check_solution()
			solved_puzzle_conditions()
	elif left_button3_selected:
		if wire3connected:
			wire3connected = false
			ShapeButtonLeft3.global_position = ShapeButtonLeft3DefaultPos
			Wire3.clear_points()
			wire3_shape_connection.clear()
		else:
			var offset = (ShapeButtonLeft3.size * 0.5 * ShapeButtonLeft3.get_global_transform().get_scale())
			var connector_collision_shape = shape_connector.get_node('CollisionShape2D')
			wire3connected = true
			ShapeButtonLeft3.global_position = shape_connector.global_position - (connector_collision_shape.shape.size * 0.5 * connector_collision_shape.global_scale)
			Wire3.clear_points()
			Wire3.add_point(Wire3.to_local(ShapeButtonLeft3DefaultPos + offset - Vector2(offset.x, 0)))
			Wire3.add_point(Wire3.to_local(shape_connector.global_position))
			
			wire3_shape_connection.append(ShapeButtonLeft3.shape)
			wire3_shape_connection.append(shape_connector.shape)
			
			check_solution()
			solved_puzzle_conditions()
	elif left_button4_selected:
		if wire4connected:
			wire4connected = false
			ShapeButtonLeft4.global_position = ShapeButtonLeft4DefaultPos
			Wire4.clear_points()
			wire4_shape_connection.clear()
		else:
			var offset = (ShapeButtonLeft4.size * 0.5 * ShapeButtonLeft4.get_global_transform().get_scale())
			var connector_collision_shape = shape_connector.get_node('CollisionShape2D')
			wire4connected = true
			ShapeButtonLeft4.global_position = shape_connector.global_position - (connector_collision_shape.shape.size * 0.5 * connector_collision_shape.global_scale)
			Wire4.clear_points()
			Wire4.add_point(Wire4.to_local(ShapeButtonLeft4DefaultPos + offset - Vector2(offset.x, 0)))
			Wire4.add_point(Wire4.to_local(shape_connector.global_position))
			
			wire4_shape_connection.append(ShapeButtonLeft4.shape)
			wire4_shape_connection.append(shape_connector.shape)
			
			check_solution()
			solved_puzzle_conditions()

func _on_shape_button_left_1_button_down() -> void:
	left_button1_selected = true

func _on_shape_button_left_1_button_up() -> void:
	if right_area1_entered:
		check_wire_connection(ShapeConnectorRight1)
	elif right_area2_entered:
		check_wire_connection(ShapeConnectorRight2)
	elif right_area3_entered:
		check_wire_connection(ShapeConnectorRight3)
	elif right_area4_entered:
		check_wire_connection(ShapeConnectorRight4)
	elif not right_area1_entered:
		ShapeButtonLeft1.global_position = ShapeButtonLeft1DefaultPos
		Wire1.clear_points()
	elif not right_area2_entered:
		ShapeButtonLeft1.global_position = ShapeButtonLeft1DefaultPos
		Wire1.clear_points()
	elif not right_area3_entered:
		ShapeButtonLeft1.global_position = ShapeButtonLeft1DefaultPos
		Wire1.clear_points()
	elif not right_area4_entered:
		ShapeButtonLeft1.global_position = ShapeButtonLeft1DefaultPos
		Wire1.clear_points()
		
	if not wire1connected:
		ShapeButtonLeft1.global_position = ShapeButtonLeft1DefaultPos
		Wire1.clear_points()
		
	left_button1_selected = false

func _on_shape_button_left_2_button_down() -> void:
	left_button2_selected = true

func _on_shape_button_left_2_button_up() -> void:
	if right_area1_entered:
		check_wire_connection(ShapeConnectorRight1)
	elif right_area2_entered:
		check_wire_connection(ShapeConnectorRight2)
	elif right_area3_entered:
		check_wire_connection(ShapeConnectorRight3)
	elif right_area4_entered:
		check_wire_connection(ShapeConnectorRight4)
	elif not right_area1_entered:
		ShapeButtonLeft2.global_position = ShapeButtonLeft2DefaultPos
		Wire2.clear_points()
	elif not right_area2_entered:
		ShapeButtonLeft2.global_position = ShapeButtonLeft2DefaultPos
		Wire2.clear_points()
	elif not right_area3_entered:
		ShapeButtonLeft2.global_position = ShapeButtonLeft2DefaultPos
		Wire2.clear_points()
	elif not right_area4_entered:
		ShapeButtonLeft2.global_position = ShapeButtonLeft2DefaultPos
		Wire2.clear_points()
	
	if not wire2connected:
		ShapeButtonLeft2.global_position = ShapeButtonLeft2DefaultPos
		Wire2.clear_points()
		
	left_button2_selected = false

func _on_shape_button_left_3_button_down() -> void:
	left_button3_selected = true

func _on_shape_button_left_3_button_up() -> void:
	if right_area1_entered:
		check_wire_connection(ShapeConnectorRight1)
	elif right_area2_entered:
		check_wire_connection(ShapeConnectorRight2)
	elif right_area3_entered:
		check_wire_connection(ShapeConnectorRight3)
	elif right_area4_entered:
		check_wire_connection(ShapeConnectorRight4)
	elif not right_area1_entered:
		ShapeButtonLeft3.global_position = ShapeButtonLeft3DefaultPos
		Wire3.clear_points()
	elif not right_area2_entered:
		ShapeButtonLeft3.global_position = ShapeButtonLeft3DefaultPos
		Wire3.clear_points()
	elif not right_area3_entered:
		ShapeButtonLeft3.global_position = ShapeButtonLeft3DefaultPos
		Wire3.clear_points()
	elif not right_area4_entered:
		ShapeButtonLeft3.global_position = ShapeButtonLeft3DefaultPos
		Wire3.clear_points()
	
	if not wire3connected:
		ShapeButtonLeft3.global_position = ShapeButtonLeft3DefaultPos
		Wire3.clear_points()
		
	left_button3_selected = false

func _on_shape_button_left_4_button_down() -> void:
	left_button4_selected = true

func _on_shape_button_left_4_button_up() -> void:
	if right_area1_entered:
		check_wire_connection(ShapeConnectorRight1)
	elif right_area2_entered:
		check_wire_connection(ShapeConnectorRight2)
	elif right_area3_entered:
		check_wire_connection(ShapeConnectorRight3)
	elif right_area4_entered:
		check_wire_connection(ShapeConnectorRight4)
	elif not right_area1_entered:
		ShapeButtonLeft4.global_position = ShapeButtonLeft4DefaultPos
		Wire4.clear_points()
	elif not right_area2_entered:
		ShapeButtonLeft4.global_position = ShapeButtonLeft4DefaultPos
		Wire4.clear_points()
	elif not right_area3_entered:
		ShapeButtonLeft4.global_position = ShapeButtonLeft4DefaultPos
		Wire4.clear_points()
	elif not right_area4_entered:
		ShapeButtonLeft4.global_position = ShapeButtonLeft4DefaultPos
		Wire4.clear_points()
	
	if not wire4connected:
		ShapeButtonLeft4.global_position = ShapeButtonLeft4DefaultPos
		Wire4.clear_points()
		
	left_button4_selected = false

func _on_shape_connector_right_1_mouse_entered() -> void:
	right_area1_entered = true

func _on_shape_connector_right_2_mouse_entered() -> void:
	right_area2_entered = true

func _on_shape_connector_right_3_mouse_entered() -> void:
	right_area3_entered = true

func _on_shape_connector_right_4_mouse_entered() -> void:
	right_area4_entered = true

func _on_shape_connector_right_1_mouse_exited() -> void:
	right_area1_entered = false
	
func _on_shape_connector_right_2_mouse_exited() -> void:
	right_area2_entered = false

func _on_shape_connector_right_3_mouse_exited() -> void:
	right_area3_entered = false

func _on_shape_connector_right_4_mouse_exited() -> void:
	right_area4_entered = false
