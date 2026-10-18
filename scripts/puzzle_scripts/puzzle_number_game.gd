extends Control

var numbers = []

@export var solved = false
@export var number_solution = []
@export var color_designation = 'red'
@export var puzzle_type = "NumberGame"

var changeNumber1 = 0
var changeNumber2 = 0
var changeNumber3 = 0
var changeNumber4 = 0
var changeNumber5 = 0

func create_number_solution() -> void:
	for x in 5:
		number_solution.append(randi_range(0, 9))

func _ready():
	create_number_solution()
	print(number_solution)
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
	$AnimatedSprite2D2.frame = changeNumber2

#--------------------------[button 2 down slot 2]---------------------------------------

func _on_button_down_2_pressed() -> void:
	if changeNumber2 >= 0:
		changeNumber2 -= 1
	else:
		changeNumber2 = 9
	$AnimatedSprite2D2.frame = changeNumber2
	

#--------------------------[button 3 up slot 3]---------------------------------------

func _on_button_up_3_pressed() -> void:
	if changeNumber3 <= 9:
		changeNumber3 += 1
	else:
		changeNumber3 = 0
	$AnimatedSprite2D3.frame = changeNumber3
	

#--------------------------[button 3 down slot 3]---------------------------------------

func _on_button_down_3_pressed() -> void:
	if changeNumber3 >= 0:
		changeNumber3 -= 1
	else:
		changeNumber3 = 9
	$AnimatedSprite2D3.frame = changeNumber3
	

#--------------------------[button 4 up slot 4]---------------------------------------

func _on_button_up_4_pressed() -> void:
	if changeNumber4 <= 9:
		changeNumber4 += 1
	else:
		changeNumber4 = 0
	$AnimatedSprite2D4.frame = changeNumber4
	
#--------------------------[button 4 down slot 4]---------------------------------------

func _on_button_down_4_pressed() -> void:
	if changeNumber4 >= 0:
		changeNumber4 -= 1
	else:
		changeNumber4 = 9
	$AnimatedSprite2D4.frame = changeNumber4

#--------------------------[button 5 up slot 5]---------------------------------------

func _on_button_up_5_pressed() -> void:
	if changeNumber5 <= 9:
		changeNumber5 += 1
	else:
		changeNumber5 = 0
	$AnimatedSprite2D5.frame = changeNumber5
	

#--------------------------[button 5 down slot 5]---------------------------------------

func _on_button_down_5_pressed() -> void:
	if changeNumber5 >= 0:
		changeNumber5 -= 1
	else:
		changeNumber5 = 9
	$AnimatedSprite2D5.frame = changeNumber5



#-----------------------[animation logic slot 1]-----------------------------------

func _on_animated_sprite_2d_frame_changed() -> void:
	print("correct answer for slot 1 is ", number_solution[0])
	
	if $AnimatedSprite2D.animation == 'number_lock':
		if $AnimatedSprite2D.frame == number_solution[0]:
			print("disabling since correct answer was ", number_solution[0])
			$buttonUp1.disabled = true
			$buttonDown1.disabled = true
	print("slot 1 on frame ", $AnimatedSprite2D.frame)

#-----------------------[animation logic slot 2]-----------------------------------

func _on_animated_sprite_2d_2_frame_changed() -> void:
	print("correct answer for slot 2 is ", number_solution[1])
	
	if $AnimatedSprite2D2.animation == 'number_lock':
		if $AnimatedSprite2D2.frame == number_solution[1]:
			print("disabling since correct answer was ", number_solution[1])
			$buttonUp2.disabled = true
			$buttonDown2.disabled = true
	print("slot 2 on frame ", $AnimatedSprite2D2.frame)

#-----------------------[animation logic slot 3]-----------------------------------

func _on_animated_sprite_2d_3_frame_changed() -> void:
	print("correct answer for slot 3 is ", number_solution[2])
	
	if $AnimatedSprite2D3.animation == 'number_lock':
		if $AnimatedSprite2D3.frame == number_solution[2]:
			print("disabling since correct answer was ", number_solution[2])
			$buttonUp3.disabled = true
			$buttonDown3.disabled = true
	print("slot 3 on frame ", $AnimatedSprite2D3.frame)

#-----------------------[animation logic slot 4]-----------------------------------

func _on_animated_sprite_2d_4_frame_changed() -> void:
	print("correct answer for slot 4 is ", number_solution[3])
	
	if $AnimatedSprite2D4.animation == 'number_lock':
		if $AnimatedSprite2D4.frame == number_solution[3]:
			print("disabling since correct answer was ", number_solution[3])
			$buttonUp4.disabled = true
			$buttonDown4.disabled = true
			
			if $AnimatedSprite2D4.frame == 9:
				$buttonDown4.disabled = true
				$buttonUp4.disabled = true
			
			# seems that when you hold down the button as it disables it still loops
		
	print("slot 4 on frame ", $AnimatedSprite2D4.frame)

#-----------------------[animation logic slot 5]-----------------------------------

func _on_animated_sprite_2d_5_frame_changed() -> void:
	print("correct answer for slot 5 is ", number_solution[4])
	
	if $AnimatedSprite2D5.animation == 'number_lock':
		if $AnimatedSprite2D5.frame == number_solution[4]:
			print("disabling since correct answer was ", number_solution[4])
			$buttonUp5.disabled = true
			$buttonDown5.disabled = true
	print("slot 5 on frame ", $AnimatedSprite2D5.frame)
