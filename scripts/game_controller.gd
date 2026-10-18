class_name GameController extends Node

# Here you define all our different scenes for the game. 
# They are defined as 'var', i.e var main_menu.
# Exporting the scene variable that will be shown when the game opens.
# I've currently made an empty main menu scene and exported that.
# I'm assuming we want the game to start at the main menu.
@export var main_menu : Control
# var game_scene_example

func _ready() -> void:
	Global.game_controller = self
	
func change_to_bomb_and_frog_scene():
	Global.game_controller.get_child(0).queue_free()
	var bomb_and_frog = preload("res://scenes/bomb_and_frog.tscn").instantiate()
	Global.game_controller.add_child(bomb_and_frog)
	
func change_to_main_menu_scene():
	var bomb_and_frog = Global.game_controller.get_child(0)
	Global.game_controller.get_child(0).queue_free()
	var main_menu = preload("res://scenes/main_menu.tscn").instantiate()
	Global.game_controller.add_child(main_menu)
	
# Here we would add the functions that we call from the game to change to different scenes.
# I can't start writing one ssince we don't have the scenes and each one has different
# requirements. Such as if the scene needs to still exist in the background for things 
# like timers or other nodes. Here is what the structure would kind of be like:
# func change_to_game_scene_example(current_scene):
#	Any code for scenes and nodes that needs to be done for the game, i.e keep a scene in the background.
#	Code for switching the actual scenes (example):
#	Global.game_controller.remove_child(current_scene)
#	var game_scene_example = preload("path_to_scene").instantiate()
#	Global.game_controller.add_child(game_scene_example)
