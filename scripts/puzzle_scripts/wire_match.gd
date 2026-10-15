extends Control

var selected = false
var mouse_offset = Vector2(0,0)

@export var solved = false
@export var shape_solution = []
@export var color_designation = 'yellow'

@onready var wireConnector = $WireConnector

func _process(delta):
	if selected:
		follow_mouse()
	
func follow_mouse():
	wireConnector.position = get_global_mouse_position()
	
func _on_texture_button_button_up() -> void:
	selected = false

func _on_texture_button_button_down() -> void:
	selected = true
