extends Control

func _ready():
	# making the up button 1, t.c
	var upButton1 = $upButton1
	upButton1.text = "▲"
	upButton1.pressed.connect(_up_button_pressed)
	add_child(upButton1)
	
	
	
	# animation spot
	
	
	
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

func _down_button_pressed():
	print("down")
