extends Control

# using this to get the button as global
@onready var up_button_1 =$upButton1

func _ready():
	# making the up button 1, t.c
	var upButton1 = $upButton1
	upButton1.text = "▲"
	upButton1.pressed.connect(_up_button_pressed)
	add_child(upButton1)
	
	
	
	# animation spot
	
	# 1. make the images that are going to be iterated through
		# 1b. add the "	Jimmy.animation.play(random_puzzle + '_' + random_puzzle_clue)"
		# from the bomb_and_frog file and the .play() stuff is not needed
		
		#2c. make sure the signals work with the buttons when they are pressed
		
		
	
	
	# 2. make the array that the shapes will be iterated through
	# 3. make the combo for the correct pattern needed for all the 5 choices
	# 4. make it to where the combo is randomized
	# 5. lock the buttons when the combo is met
	
	
	
	
	
	# making the down button 1, t.c
	var downButton1 = $downButton1
	downButton1.text = "▼"
	downButton1.pressed.connect(_down_button_pressed)
	add_child(downButton1)
	
	
	#-------------------------------------------------------------------------------
	
	
	# making the up button 2, t.c
	var upButton2 = $upButton2
	upButton2.text = "▲"
	upButton2.pressed.connect(_up_button_pressed)
	add_child(upButton2)
	
	
	
	# animation spot
	
	
	
	# making the down button 2, t.c
	var downButton2 = $downButton2
	downButton2.text = "▼"
	downButton2.pressed.connect(_down_button_pressed)
	add_child(downButton2)
	
	
	#-------------------------------------------------------------------------------
	
	
	# making the up button 3, t.c
	var upButton3 = $upButton3
	upButton3.text = "▲"
	upButton3.pressed.connect(_up_button_pressed)
	add_child(upButton3)
	
	
	
	# animation spot
	
	
	
	# making the down button 3, t.c
	var downButton3 = $downButton3
	downButton3.text = "▼"
	downButton3.pressed.connect(_down_button_pressed)
	add_child(downButton3)
	
	
	#-------------------------------------------------------------------------------
		
	
	# making the up button 4, t.c
	var upButton4 = $upButton4
	upButton4.text = "▲"
	upButton4.pressed.connect(_up_button_pressed)
	add_child(upButton4)
	
	
	# animation spot
		
		
	# making the down button 4, t.c
	var downButton4 = $downButton4
	downButton4.text = "▼"
	downButton4.pressed.connect(_down_button_pressed)
	add_child(downButton4)


	#-------------------------------------------------------------------------------
	
	
	# making the up button 5, t.c
	var upButton5 = $upButton5
	upButton5.text = "▲"
	upButton5.pressed.connect(_up_button_pressed)
	add_child(upButton5)
	
	
	# animation spot
	
	
	# making the up button 5, t.c
	var downButton5 = $downButton5
	downButton5.text = "▼"
	downButton5.pressed.connect(_down_button_pressed)
	add_child(downButton5)
	
	
	#-------------------------------------------------------------------------------


func _up_button_pressed():
	print("up")
	
	# make it to where the shapes move up one in array

func _down_button_pressed():
	print("down")
	
	#  make the shapes move down in the array starting from the last and going to the first node
