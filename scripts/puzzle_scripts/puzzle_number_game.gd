extends Control

var numbers = []

@export var solved = false
@export var number_solution = []
@export var color_designation = 'red'
@export var puzzle_type = "NumberGame"


func create_number_solution() -> void:
	for x in 5:
		number_solution.append(randi_range(0, 9))

# for manually changing the puzzle answers
var slot_1_answer = 5
var slot_2_answer = 4
var slot_3_answer = 2
var slot_4_answer = 9
var slot_5_answer = 6

func _ready():
	create_number_solution()
	print(number_solution)
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


func _on_button_up_1_button_down() -> void:
	$AnimatedSprite2D.play("number_lock")


#--------------------------[button 1 down slot 1]---------------------------------------

func _on_button_down_1_button_up() -> void:
	$AnimatedSprite2D.pause()


func _on_button_down_1_button_down() -> void:
	$AnimatedSprite2D.play_backwards("number_lock")
	
	
#--------------------------[button 2 up slot 2]---------------------------------------

func _on_button_up_2_button_up() -> void:
	$AnimatedSprite2D2.pause()


func _on_button_up_2_button_down() -> void:
	$AnimatedSprite2D2.play("number_lock")
	

#--------------------------[button 2 down slot 2]---------------------------------------

func _on_button_down_2_button_up() -> void:
	$AnimatedSprite2D2.pause()


func _on_button_down_2_button_down() -> void:
	$AnimatedSprite2D2.play_backwards("number_lock")
	

#--------------------------[button 3 up slot 3]---------------------------------------

func _on_button_up_3_button_up() -> void:
	$AnimatedSprite2D3.pause()


func _on_button_up_3_button_down() -> void:
	$AnimatedSprite2D3.play("number_lock")
	

#--------------------------[button 3 down slot 3]---------------------------------------

func _on_button_down_3_button_up() -> void:
	$AnimatedSprite2D3.pause()


func _on_button_down_3_button_down() -> void:
	$AnimatedSprite2D3.play_backwards("number_lock")
	

#--------------------------[button 4 up slot 4]---------------------------------------

func _on_button_up_4_button_up() -> void:
	$AnimatedSprite2D4.pause()
	
	
func _on_button_up_4_button_down() -> void:
	if $AnimatedSprite2D4.is_playing("number_lock"):
		if $buttonUp4.disabled != true:
			$AnimatedSprite2D4.play("number_lock")
	
	
#--------------------------[button 4 down slot 4]---------------------------------------

func _on_button_down_4_button_up() -> void:
	$AnimatedSprite2D4.pause()
	
	
func _on_button_down_4_button_down() -> void:
	$AnimatedSprite2D4.play_backwards("number_lock")
	

#--------------------------[button 5 up slot 5]---------------------------------------

func _on_button_up_5_button_up() -> void:
	$AnimatedSprite2D5.pause()
	

func _on_button_up_5_button_down() -> void:
	$AnimatedSprite2D5.play("number_lock")
	

#--------------------------[button 5 down slot 5]---------------------------------------

func _on_button_down_5_button_up() -> void:
	$AnimatedSprite2D5.pause()
	

func _on_button_down_5_button_down() -> void:
	$AnimatedSprite2D5.play_backwards("number_lock")
	

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

var changeNumber = 0
var currentNumber

func _on_button_up_1_pressed() -> void:
	if changeNumber <= 9:
		changeNumber += 1
	else:
		changeNumber = 0
	$AnimatedSprite2D.frame = changeNumber


func _on_button_down_1_pressed() -> void:
	if changeNumber >= 0:
		changeNumber -= 1
	else:
		changeNumber = 9
	$AnimatedSprite2D.frame = changeNumber
