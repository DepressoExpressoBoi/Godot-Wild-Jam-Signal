extends Control

@onready var slot_1_answer: int = $AnimatedSprite2D.frame
var slot_2_answer = 4
var slot_3_answer = 2
var slot_4_answer = 9
var slot_5_answer = 6

var numbers = []

var changeNumber1 = 0 
var changeNumber2 = 0
var changeNumber3 = 0 
var changeNumber4= 0
var changeNumber5 = 0

func _ready():
	#--------------------------[button 1 slot 1]---------------------------------------
	
	# making button 1 up, t.c.
	var upButton1 = $buttonUp1
	upButton1.text = "▲"	

	# making the down button 1, t.c
	var downButton1 = $buttonDown1
	downButton1.text = "▼"
	
#--------------------------[button 2 slot 2]---------------------------------------

	var upButton2 = $buttonUp2
	upButton2.text = "▲"	

	var downButton2 = $buttonDown2
	downButton2.text = "▼"
	
#--------------------------[button 3 slot 3]---------------------------------------

	var upButton3 = $buttonUp3
	upButton3.text = "▲"	

	var downButton3 = $buttonDown3
	downButton3.text = "▼"

#--------------------------[button 4 slot 4]---------------------------------------

	var upButton4 = $buttonUp4
	upButton4.text = "▲"	

	var downButton4 = $buttonDown4
	downButton4.text = "▼"

#--------------------------[button 5 slot 5]---------------------------------------

	var upButton5 = $buttonUp5
	upButton5.text = "▲"	

	var downButton5 = $buttonDown5
	downButton5.text = "▼"









#--------------------------[button 1 up slot 1]---------------------------------------

func _on_button_up_1_pressed() -> void:
	if changeNumber1 <= 9:
		changeNumber1 += 1
	else:
		changeNumber1 = 0
	$AnimatedSprite2D.frame = changeNumber1



#--------------------------[button 1 down slot 1]---------------------------------------

func _on_button_down_1_pressed() -> void:
	if changeNumber1 >= 0:
		changeNumber1 -= 1
	else:
		changeNumber1 = 9
	$AnimatedSprite2D.frame = changeNumber1

	
#--------------------------[button 2 up slot 2]---------------------------------------

func _on_button_up_2_pressed() -> void:
	if changeNumber2 <= 9:
		changeNumber2 += 1
	else:
		changeNumber2 = 0
	$AnimatedSprite2D.frame = changeNumber2

#--------------------------[button 2 down slot 2]---------------------------------------

func _on_button_down_2_pressed() -> void:
	if changeNumber2 >= 0:
		changeNumber2 -= 1
	else:
		changeNumber2 = 9
	$AnimatedSprite2D.frame = changeNumber2
	

#--------------------------[button 3 up slot 3]---------------------------------------

func _on_button_up_3_pressed() -> void:
	if changeNumber3 <= 9:
		changeNumber3 += 1
	else:
		changeNumber3 = 0
	$AnimatedSprite2D.frame = changeNumber3
	

#--------------------------[button 3 down slot 3]---------------------------------------

func _on_button_down_3_pressed() -> void:
	if changeNumber3 >= 0:
		changeNumber3 -= 1
	else:
		changeNumber3 = 9
	$AnimatedSprite2D.frame = changeNumber3
	

#--------------------------[button 4 up slot 4]---------------------------------------

func _on_button_up_4_pressed() -> void:
	if changeNumber4 <= 9:
		changeNumber4 += 1
	else:
		changeNumber4 = 0
	$AnimatedSprite2D.frame = changeNumber4
	
#--------------------------[button 4 down slot 4]---------------------------------------

func _on_button_down_4_pressed() -> void:
	if changeNumber4 >= 0:
		changeNumber4 -= 1
	else:
		changeNumber4 = 9
	$AnimatedSprite2D.frame = changeNumber4

#--------------------------[button 5 up slot 5]---------------------------------------

func _on_button_up_5_pressed() -> void:
	if changeNumber5 <= 9:
		changeNumber5 += 1
	else:
		changeNumber5 = 0
	$AnimatedSprite2D.frame = changeNumber5
	

#--------------------------[button 5 down slot 5]---------------------------------------

func _on_button_down_5_pressed() -> void:
	if changeNumber5 >= 0:
		changeNumber5 -= 1
	else:
		changeNumber5 = 9
	$AnimatedSprite2D.frame = changeNumber5



#-----------------------[animation logic slot 1]-----------------------------------

func _on_animated_sprite_2d_frame_changed() -> void:
	print("correct answer for slot 1 is ", slot_1_answer)
	
	if $AnimatedSprite2D.animation == 'number_lock':
		if $AnimatedSprite2D.frame == slot_1_answer:
			print("disabling since correct answer was ", slot_1_answer)
			$buttonUp1.disabled = true
			$buttonDown1.disabled = true
	print("slot 1 on frame ", $AnimatedSprite2D.frame)

#-----------------------[animation logic slot 2]-----------------------------------

func _on_animated_sprite_2d_2_frame_changed() -> void:
	print("correct answer for slot 2 is ", slot_2_answer)
	
	if $AnimatedSprite2D2.animation == 'number_lock':
		if $AnimatedSprite2D2.frame == slot_2_answer:
			print("disabling since correct answer was ", slot_2_answer)
			$buttonUp2.disabled = true
			$buttonDown2.disabled = true
	print("slot 2 on frame ", $AnimatedSprite2D2.frame)

#-----------------------[animation logic slot 3]-----------------------------------

func _on_animated_sprite_2d_3_frame_changed() -> void:
	print("correct answer for slot 3 is ", slot_3_answer)
	
	if $AnimatedSprite2D3.animation == 'number_lock':
		if $AnimatedSprite2D3.frame == slot_3_answer:
			print("disabling since correct answer was ", slot_3_answer)
			$buttonUp3.disabled = true
			$buttonDown3.disabled = true
	print("slot 3 on frame ", $AnimatedSprite2D3.frame)

#-----------------------[animation logic slot 4]-----------------------------------

func _on_animated_sprite_2d_4_frame_changed() -> void:
	print("correct answer for slot 4 is ", slot_4_answer)
	
	if $AnimatedSprite2D4.animation == 'number_lock':
		if $AnimatedSprite2D4.frame == slot_4_answer:
			print("disabling since correct answer was ", slot_4_answer)
			$buttonUp4.disabled = true
			$buttonDown4.disabled = true
			
			if $AnimatedSprite2D4.frame == 9:
				$buttonDown4.disabled = true
				$buttonUp4.disabled = true
			
			# seems that when you hold down the button as it disables it still loops
		
	print("slot 4 on frame ", $AnimatedSprite2D4.frame)

#-----------------------[animation logic slot 5]-----------------------------------

func _on_animated_sprite_2d_5_frame_changed() -> void:
	print("correct answer for slot 5 is ", slot_5_answer)
	
	if $AnimatedSprite2D5.animation == 'number_lock':
		if $AnimatedSprite2D5.frame == slot_5_answer:
			print("disabling since correct answer was ", slot_5_answer)
			$buttonUp5.disabled = true
			$buttonDown5.disabled = true
	print("slot 5 on frame ", $AnimatedSprite2D5.frame)
