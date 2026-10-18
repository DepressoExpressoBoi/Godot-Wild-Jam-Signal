extends Control

func _ready():
	
	#--------------------------[button 1 slot 1]---------------------------------------
	
	# making button 1 up, t.c.
	var upButton1 = $buttonUp1
	upButton1.text = "▲"	
	upButton1.pressed.connect(_on_button_up_1_button_down)
	upButton1.pressed.connect(_on_button_up_1_button_up)
	add_child(upButton1)


	# making the down button 1, t.c
	var downButton1 = $buttonDown1
	downButton1.text = "▼"
	downButton1.pressed.connect(_on_button_down_1_button_down)
	downButton1.pressed.connect(_on_button_down_1_button_up)
	add_child(downButton1)

#--------------------------[button 2 slot 2]---------------------------------------

	var upButton2 = $buttonUp2
	upButton2.text = "▲"	
	upButton2.pressed.connect(_on_button_up_2_button_down)
	upButton2.pressed.connect(_on_button_up_2_button_up)
	add_child(upButton2)

	var downButton2 = $buttonDown2
	downButton2.text = "▼"
	downButton2.pressed.connect(_on_button_down_2_button_down)
	downButton2.pressed.connect(_on_button_down_2_button_up)
	add_child(downButton2)
	
#--------------------------[button 3 slot 3]---------------------------------------

	var upButton3 = $buttonUp3
	upButton3.text = "▲"	
	upButton3.pressed.connect(_on_button_up_3_button_down)
	upButton3.pressed.connect(_on_button_up_3_button_up)
	add_child(upButton3)

	var downButton3 = $buttonDown3
	downButton3.text = "▼"
	downButton3.pressed.connect(_on_button_down_3_button_down)
	downButton3.pressed.connect(_on_button_down_3_button_up)
	add_child(downButton3)

#--------------------------[button 4 slot 4]---------------------------------------

	var upButton4 = $buttonUp4
	upButton4.text = "▲"	
	upButton4.pressed.connect(_on_button_up_4_button_down)
	upButton4.pressed.connect(_on_button_up_4_button_up)
	add_child(upButton4)

	var downButton4 = $buttonDown4
	downButton4.text = "▼"
	downButton4.pressed.connect(_on_button_down_4_button_down)
	downButton4.pressed.connect(_on_button_down_4_button_up)
	add_child(downButton4)

#--------------------------[button 5 slot 5]---------------------------------------

	var upButton5 = $buttonUp5
	upButton5.text = "▲"	
	upButton5.pressed.connect(_on_button_up_5_button_down)
	upButton5.pressed.connect(_on_button_up_5_button_up)
	add_child(upButton5)

	var downButton5 = $buttonDown5
	downButton5.text = "▼"
	downButton5.pressed.connect(_on_button_down_5_button_down)
	downButton5.pressed.connect(_on_button_down_5_button_up)
	add_child(downButton4)









#--------------------------[button 1 up slot 1]---------------------------------------

func _on_button_up_1_button_up() -> void:
	$AnimatedSprite2D.pause()
	
	print("paused_button_up_1_button_up") # delete me


func _on_button_up_1_button_down() -> void:
	$AnimatedSprite2D.play("number_lock")
	
	print("pressed_button_up_1_button_down") #delete me

#--------------------------[button 1 down slot 1]---------------------------------------

func _on_button_down_1_button_up() -> void:
	$AnimatedSprite2D.pause()
	
	print("paused_button_down_1_button_up") # delete me


func _on_button_down_1_button_down() -> void:
	$AnimatedSprite2D.play_backwards("number_lock")
	
	print("pressed_button_down_1_button_down") #delete me
	
#--------------------------[button 2 up slot 2]---------------------------------------

func _on_button_up_2_button_up() -> void:
	$AnimatedSprite2D2.pause()
	
	print("paused_button_up_2_button_up") # delete me


func _on_button_up_2_button_down() -> void:
	$AnimatedSprite2D2.play("number_lock")
	
	print("pressed_button_up_2_button_down") #delete me

#--------------------------[button 2 down slot 2]---------------------------------------

func _on_button_down_2_button_up() -> void:
	$AnimatedSprite2D2.pause()
	
	print("paused_button_down_2_button_up") # delete me


func _on_button_down_2_button_down() -> void:
	$AnimatedSprite2D2.play_backwards("number_lock")
	
	print("pressed_button_down_2_button_down") #delete me

#--------------------------[button 3 up slot 3]---------------------------------------

func _on_button_up_3_button_up() -> void:
	$AnimatedSprite2D3.pause()
	
	print("paused_button_up_3_button_up") # delete me


func _on_button_up_3_button_down() -> void:
	$AnimatedSprite2D3.play("number_lock")
	
	print("pressed_button_up_3_button_down") #delete me

#--------------------------[button 3 down slot 3]---------------------------------------

func _on_button_down_3_button_up() -> void:
	$AnimatedSprite2D3.pause()
	
	print("paused_button_down_3_button_up") # delete me


func _on_button_down_3_button_down() -> void:
	$AnimatedSprite2D3.play_backwards("number_lock")
	
	print("pressed_button_down_3_button_down") #delete me

#--------------------------[button 4 up slot 4]---------------------------------------

func _on_button_up_4_button_up() -> void:
	$AnimatedSprite2D4.pause()
	
	print("paused_button_up_4_button_up") # delete me
	
	
func _on_button_up_4_button_down() -> void:
	$AnimatedSprite2D4.play("number_lock")
	
	print("pressed_button_up_4_button_down") #delete me
	
#--------------------------[button 4 down slot 4]---------------------------------------

func _on_button_down_4_button_up() -> void:
	$AnimatedSprite2D4.pause()
	
	print("paused_button_down_4_button_up") # delete me
	
	
func _on_button_down_4_button_down() -> void:
	$AnimatedSprite2D4.play_backwards("number_lock")
	
	print("pressed_button_down_4_button_down") #delete me

#--------------------------[button 5 up slot 5]---------------------------------------

func _on_button_up_5_button_up() -> void:
	$AnimatedSprite2D5.pause()
	
	print("paused_button_up_5_button_up") # delete me
	

func _on_button_up_5_button_down() -> void:
	$AnimatedSprite2D5.play("number_lock")
	
	print("pressed_button_up_5_button_down") #delete me

#--------------------------[button 5 down slot 5]---------------------------------------

func _on_button_down_5_button_up() -> void:
	$AnimatedSprite2D5.pause()
	
	print("paused_button_down_5_button_up") # delete me


func _on_button_down_5_button_down() -> void:
	$AnimatedSprite2D5.play_backwards("number_lock")
	
	print("pressed_button_down_5_button_down") #delete me
