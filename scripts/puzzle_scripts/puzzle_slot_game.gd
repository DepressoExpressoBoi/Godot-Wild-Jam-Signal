extends Control

# for manually changing the puzzle answers
@onready var slot_1_answer: int = $AnimatedSprite2D.frame
var slot_2_answer = 4
var slot_3_answer = 2
var slot_4_answer = 9
var slot_5_answer = 6

func _ready():
	
	#--------------------------[button 1]---------------------------------------
	
	# making button 1 up top, t.c.
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
	
# when button is clicked it will move the animation
func _on_up_button_1_button_down() -> void:
	$AnimatedSprite2D.play("final_shape_lock")
	
#--------------------------[button 1 down]---------------------------------------

func _on_down_button_1_button_up() -> void:
	$AnimatedSprite2D.pause()
	
func _on_down_button_1_button_down() -> void:
	$AnimatedSprite2D.play_backwards("final_shape_lock")
	
#--------------------------[button 2 up]---------------------------------------

func _on_up_button_2_button_up() -> void:
	$AnimatedSprite2D2.pause()

func _on_up_button_2_button_down() -> void:
	$AnimatedSprite2D2.play("final_shape_lock")
	
#--------------------------[button 2 down]---------------------------------------

func _on_down_button_2_button_up() -> void:
	$AnimatedSprite2D2.pause()

func _on_down_button_2_button_down() -> void:
	$AnimatedSprite2D2.play_backwards("final_shape_lock")
	
#--------------------------[button 3 up]---------------------------------------

func _on_up_button_3_button_up() -> void:
	$AnimatedSprite2D3.pause()

func _on_up_button_3_button_down() -> void:
	$AnimatedSprite2D3.play("final_shape_lock")
	
#--------------------------[button 3 down]---------------------------------------

func _on_down_button_3_button_up() -> void:
	$AnimatedSprite2D3.pause()
	
func _on_down_button_3_button_down() -> void:
	$AnimatedSprite2D3.play_backwards("final_shape_lock")
	
#--------------------------[button 4 up]---------------------------------------

func _on_up_button_4_button_up() -> void:
	$AnimatedSprite2D4.pause()

func _on_up_button_4_button_down() -> void:
	$AnimatedSprite2D4.play("final_shape_lock")
	
#--------------------------[button 4 down]---------------------------------------

func _on_down_button_4_button_up() -> void:
	$AnimatedSprite2D4.pause()

func _on_down_button_4_button_down() -> void:
	$AnimatedSprite2D4.play_backwards("final_shape_lock")
	
#--------------------------[button 4 up]---------------------------------------

func _on_up_button_5_button_up() -> void:
	$AnimatedSprite2D5.pause()

func _on_up_button_5_button_down() -> void:
	$AnimatedSprite2D5.play("final_shape_lock")
	
#--------------------------[button 4 down]---------------------------------------

func _on_down_button_5_button_up() -> void:
	$AnimatedSprite2D5.pause()
	
func _on_down_button_5_button_down() -> void:
	$AnimatedSprite2D5.play_backwards("final_shape_lock")





#-----------------------[animation logic slot 1]-----------------------------------
	
func _on_animated_sprite_2d_frame_changed() -> void:
	print("correct answer for slot 1 is ", slot_1_answer)
	
	if $AnimatedSprite2D.animation == 'final_shape_lock':
		if $AnimatedSprite2D.frame == slot_1_answer:
			print("disabling since correct answer was ", slot_1_answer)
			$upButton1.disabled = true
			$downButton1.disabled = true
	print("slot 1 on frame ", $AnimatedSprite2D.frame)
	
	
#-----------------------[animation logic slot 2]-----------------------------------

func _on_animated_sprite_2d_2_frame_changed() -> void:
	print("correct answer for slot 2 is ", slot_2_answer)
	
	if $AnimatedSprite2D2.animation == 'final_shape_lock':
		if $AnimatedSprite2D2.frame == slot_2_answer:
			print("disabling since correct answer was ", slot_2_answer)
			$upButton2.disabled = true
			$downButton2.disabled = true
	print("slot 2 on frame ", $AnimatedSprite2D2.frame)
	
	
#-----------------------[animation logic slot 3]-----------------------------------

func _on_animated_sprite_2d_3_frame_changed() -> void:
	print("correct answer for slot 3 is ", slot_3_answer)
	
	if $AnimatedSprite2D3.animation == 'final_shape_lock':
		if $AnimatedSprite2D3.frame == slot_3_answer:
			print("disabling since correct answer was ", slot_3_answer)
			$upButton3.disabled = true
			$downButton3.disabled = true
	print(" slot 3 on frame ", $AnimatedSprite2D3.frame)


#-----------------------[animation logic slot 4]-----------------------------------

func _on_animated_sprite_2d_4_frame_changed() -> void:
	print("correct answer for slot 4 is ", slot_4_answer)
	
	if $AnimatedSprite2D4.animation == 'final_shape_lock':
		if $AnimatedSprite2D4.frame == slot_4_answer:
			print("disabling since correct answer was ", slot_4_answer)
			$upButton4.disabled = true
			$downButton4.disabled = true
	print(" slot 4 on frame ", $AnimatedSprite2D4.frame)

#-----------------------[animation logic slot 5]-----------------------------------

func _on_animated_sprite_2d_5_frame_changed() -> void:
	print("correct answer for slot 5 is ", slot_5_answer)
	
	if $AnimatedSprite2D5.animation == 'final_shape_lock':
		if $AnimatedSprite2D5.frame == slot_5_answer:
			print("disabling since correct answer was ", slot_5_answer)
			$upButton5.disabled = true
			$downButton5.disabled = true
	print(" slot 5 on frame ", $AnimatedSprite2D5.frame)
