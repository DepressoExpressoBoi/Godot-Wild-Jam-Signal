extends Sprite2D

@export var shape_solution = []
@export var color_designation = 'fake-puzzle'

func _on_button_pressed() -> void:
	get_parent().set_scale(Vector2(5, 5))
