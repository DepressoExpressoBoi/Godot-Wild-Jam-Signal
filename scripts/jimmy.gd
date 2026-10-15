extends Area2D

@onready var animation = $AnimatedSprite2D


func _on_animated_sprite_2d_animation_finished() -> void:
	animation.play("default")
