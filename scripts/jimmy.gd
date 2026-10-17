extends Area2D

@onready var animation = $AnimatedSprite2D
@onready var jimmy_area = $"."


func _on_animated_sprite_2d_animation_finished() -> void:
	jimmy_area.monitoring = true
	animation.play("default")
