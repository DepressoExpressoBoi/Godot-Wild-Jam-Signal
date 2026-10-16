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

	# making button 2 up, t.c.
	var upButton2 = $upButton2
	upButton2.text = "▲"	
	upButton2.pressed.connect(_on_up_button_2_button_down)
	upButton2.pressed.connect(_on_up_button_2_button_up)
	add_child(upButton2)


	# making the down button 2, t.c
	var downButton2 = $downButton2
	downButton2.text = "▼"
	downButton2.pressed.connect(_on_up_button_2_button_down)
	downButton2.pressed.connect(_on_up_button_2_button_up)
	add_child(downButton2)


#--------------------------[button 3]---------------------------------------

	# making button 3 up, t.c.
	var upButton3 = $upButton3
	upButton3.text = "▲"	
	upButton3.pressed.connect(_on_up_button_3_button_down)
	upButton3.pressed.connect(_on_up_button_3_button_up)
	add_child(upButton3)


	# making the down button 3, t.c
	var downButton3 = $downButton3
	downButton3.text = "▼"
	downButton3.pressed.connect(_on_up_button_3_button_down)
	downButton3.pressed.connect(_on_up_button_3_button_up)
	add_child(downButton3)


#--------------------------[button 4]---------------------------------------

	# making button 4 up, t.c.
	var upButton4 = $upButton4
	upButton4.text = "▲"	
	upButton4.pressed.connect(_on_up_button_4_button_down)
	upButton4.pressed.connect(_on_up_button_4_button_up)
	add_child(upButton4)


	# making the down button 4, t.c
	var downButton4 = $downButton4
	downButton4.text = "▼"
	downButton4.pressed.connect(_on_up_button_4_button_down)
	downButton4.pressed.connect(_on_up_button_4_button_up)
	add_child(downButton4)


#--------------------------[button 5]---------------------------------------


	# making button 5 up, t.c.
	var upButton5 = $upButton5
	upButton5.text = "▲"	
	upButton5.pressed.connect(_on_up_button_5_button_down)
	upButton5.pressed.connect(_on_up_button_5_button_up)
	add_child(upButton5)


	# making the down button 5, t.c
	var downButton5 = $downButton5
	downButton5.text = "▼"
	downButton5.pressed.connect(_on_up_button_5_button_down)
	downButton5.pressed.connect(_on_up_button_5_button_up)
	add_child(downButton5)









#--------------------------[button 1 up]---------------------------------------

# when button is lifted it will stop the animtions
func _on_up_button_1_button_up() -> void:
	$AnimatedSprite2D.pause()
	
	print("paused_up_button_1_button_up") # delete me
	
	
# when button is clicked it will move the animation
func _on_up_button_1_button_down() -> void:
	$AnimatedSprite2D.play("shape_lock")
	
	print("pressed_up_button_1_button_down") #delete me
	
#--------------------------[button 1 down]---------------------------------------

func _on_down_button_1_button_up() -> void:
	$AnimatedSprite2D.pause()
	
	print("paused_down_button_1_button_up") # delete me
	
	
func _on_down_button_1_button_down() -> void:
	$AnimatedSprite2D.play_backwards("shape_lock")
	
	print("pressed_down_button_1_button_down") #delete me
	
#--------------------------[button 2 up]---------------------------------------

func _on_up_button_2_button_up() -> void:
	$AnimatedSprite2D2.pause()
	
	print("paused_Up_2") # delete me


func _on_up_button_2_button_down() -> void:
	$AnimatedSprite2D2.play("shape_lock")
	
	print("pressed_Down_2") #delete me
	
#--------------------------[button 2 down]---------------------------------------

func _on_down_button_2_button_up() -> void:
	$AnimatedSprite2D2.pause()
	
	print("paused_Up_2") # delete me

func _on_down_button_2_button_down() -> void:
	$AnimatedSprite2D2.play_backwards("shape_lock")
	
	print("pressed_Down_2") #delete me
	
#--------------------------[button 3 up]---------------------------------------

func _on_up_button_3_button_up() -> void:
	$AnimatedSprite2D3.pause()
	
	print("paused_Up_3") # delete me


func _on_up_button_3_button_down() -> void:
	$AnimatedSprite2D3.play("shape_lock")
	
	print("pressed_Down_3") #delete me
	
#--------------------------[button 3 down]---------------------------------------

func _on_down_button_3_button_up() -> void:
	$AnimatedSprite2D3.pause()
	
	print("paused_Up_3") # delete me
	

func _on_down_button_3_button_down() -> void:
	$AnimatedSprite2D3.play_backwards("shape_lock")
	
	print("pressed_Down_3") #delete me
	
#--------------------------[button 4 up]---------------------------------------

func _on_up_button_4_button_up() -> void:
	$AnimatedSprite2D4.pause()
	
	print("paused_up_button_4_button_up") # delete me


func _on_up_button_4_button_down() -> void:
	$AnimatedSprite2D4.play("shape_lock")
	
	print("pressed_up_button_4_button_down") #delete me
	
#--------------------------[button 4 down]---------------------------------------

func _on_down_button_4_button_up() -> void:
	$AnimatedSprite2D4.pause()
	
	print("paused_down_button_4_button_up") # delete me


func _on_down_button_4_button_down() -> void:
	$AnimatedSprite2D4.play_backwards("shape_lock")
	
	print("pressed_down_button_4_button_down") #delete me
	
#--------------------------[button 4 up]---------------------------------------

func _on_up_button_5_button_up() -> void:
	$AnimatedSprite2D5.pause()
	
	print("paused_Up_5") # delete me

func _on_up_button_5_button_down() -> void:
	$AnimatedSprite2D5.play("shape_lock")
	
	print("pressed_up_button_5_button_down") #delete me
	
#--------------------------[button 4 down]---------------------------------------

func _on_down_button_5_button_up() -> void:
	$AnimatedSprite2D5.pause()
	
	print("paused_down_button_5_button_up") # delete me
	
func _on_down_button_5_button_down() -> void:
	$AnimatedSprite2D5.play_backwards("shape_lock")
	
	print("pressed_down_button_5_button_down") #delete me
