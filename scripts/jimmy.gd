extends Area2D

@onready var animation = $AnimatedSprite2D
@onready var jimmy_area = $"."
@onready var hurry_up_track = $HurryUpTrack
@onready var gulp_track = $GulpTrack
@onready var tongue1_track = $Tongue1Track
@onready var tongue2_track = $Tongue2Track
@onready var tongue3_track = $Tongue3Track
@onready var tongue4_track = $Tongue4Track
@onready var restart = $RestartButton
@onready var collision = $CollisionShape2D

@onready var tongue_tracks = [tongue1_track, tongue2_track, tongue3_track, tongue4_track]

func _on_animated_sprite_2d_animation_finished() -> void:
	if animation.animation != 'blow_up':
		jimmy_area.monitoring = true
		animation.offset = Vector2(0.0, 0.0) 
		animation.play("default")
	else:
		animation.visible = false
		restart.visible = true
		collision.disabled = true

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

func _on_restart_button_pressed() -> void:
	pass # Replace with function body.
