extends Control

func _ready():
	### maybe add a switch for the buttons later? start with one
	
	#--------------------------[button 1]---------------------------------------
	
	# making button 1 up, t.c.
	var upButton1 = $upButton1
	upButton1.text = "▲"	
	upButton1.pressed.connect(_on_up_button_1_button_down)
	upButton1.pressed.connect(_on_up_button_1_button_up)
	add_child(upButton1)


	# making the down button 1, t.c
	var downButton1 = $downButton1
	downButton1.text = "▼"
	downButton1.pressed.connect(_on_up_button_1_button_down)
	downButton1.pressed.connect(_on_up_button_1_button_up)
	add_child(downButton1)
	
#--------------------------[button 2]---------------------------------------

	## making button 2 up, t.c.
	#var upButton2 = $upButton2
	#upButton2.text = "▲"	
	#upButton2.pressed.connect(_on_up_button_2_button_down)
	#upButton2.pressed.connect(_on_up_button_2_button_up)
	#add_child(upButton2)
#
#
	## making the down button 2, t.c
	#var downButton2 = $downButton2
	#downButton2.text = "▼"
	#downButton2.pressed.connect(_on_up_button_2_button_down)
	#downButton2.pressed.connect(_on_up_button_2_button_up)
	#add_child(downButton2)


#--------------------------[button 3]---------------------------------------







#--------------------------[button 1 up]---------------------------------------

# when button is lifted it will stop the animtions
func _on_up_button_1_button_up() -> void:
	$AnimatedSprite2D.pause()
	
	print("paused_Up_1") # delete me
	
	
# when button is clicked it will move the animation
func _on_up_button_1_button_down() -> void:
	$AnimatedSprite2D.play("shape_lock")
	
	print("pressed_Down_1") #delete me
	
#--------------------------[button 1 down]---------------------------------------

func _on_down_button_1_button_up() -> void:
	$AnimatedSprite2D.pause()
	
	print("paused_Up_2") # delete me
	
	

func _on_down_button_1_button_down() -> void:
	$AnimatedSprite2D.play_backwards("shape_lock")
	
	print("pressed_down_2") #delete me
	
	
#--------------------------[button 2 up]---------------------------------------




#--------------------------[button 2 down]---------------------------------------
