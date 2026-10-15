extends Control

func _ready():
	# making the up button, t.c
	var upButton = $upButton
	upButton.text = "▲"
	upButton.pressed.connect(_up_button_pressed)
	add_child(upButton)
	
	# making the up button, t.c
	var downButton = $downButton
	downButton.text = "▼"
	downButton.pressed.connect(_down_button_pressed)
	add_child(downButton)

func _up_button_pressed():
	print("up")

func _down_button_pressed():
	print("down")
