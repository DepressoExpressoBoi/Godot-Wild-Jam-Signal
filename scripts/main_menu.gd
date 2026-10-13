extends Control

func _ready():
	pass
	
func _process(delta):
	pass

# Godot button pressed
func _on_button_pressed() -> void:
	Global.game_controller.change_to_bomb_and_frog_scene()
