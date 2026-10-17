extends Area2D

@onready var animation = $AnimatedSprite2D
@onready var jimmy_area = $"."


func _on_animated_sprite_2d_animation_finished() -> void:
	jimmy_area.monitoring = true
	animation.offset = Vector2(0.0, 0.0) 
	animation.play("default")

func _on_animated_sprite_2d_frame_changed() -> void:
	if animation.animation  == 'spit_out_bomb':
		if animation.frame >= 6:
			animation.offset = Vector2(-64.0, 0.0) 
		else:
			animation.offset = Vector2(0.0, 0.0) 
	if animation.animation  == 'eat_out_bomb':
		if animation.frame <= 6:
			animation.offset = Vector2(-64.0, 0.0) 
		else:
			animation.offset = Vector2(0.0, 0.0) 
