extends Control

func _ready():
	### maybe add a switch for the buttons later? start with one
	
	# making button 1 up, t.c.
	var upButton1 = $upButton1
	upButton1.text = "▲"	
	upButton1.pressed.connect(_on_up_button_1_button_down)
	upButton1.pressed.connect(_on_up_button_1_button_up)
	add_child(upButton1)



# when button is lifted it will stop the animtions
func _on_up_button_1_button_up() -> void:
	$AnimatedSprite2D.pause()
	
	print("paused") # delete me
	
	
# when button is clicked it will move the animation
func _on_up_button_1_button_down() -> void:
	$AnimatedSprite2D.play("shape_lock")
	
	print("pressed down") #delete me
