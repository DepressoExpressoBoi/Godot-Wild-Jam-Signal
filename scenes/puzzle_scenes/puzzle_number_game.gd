extends Control

func _ready():
	
	#--------------------------[button 1]---------------------------------------
	
	# making button 1 up, t.c.
	var upButton1 = $upButton1
	upButton1.text = "▲"	
	upButton1.pressed.connect(_on_button_up_1_button_down)
	upButton1.pressed.connect(_on_button_up_1_button_up)
	add_child(upButton1)


	# making the down button 1, t.c
	var downButton1 = $downButton1
	downButton1.text = "▼"
	downButton1.pressed.connect(_on_button_down_1_button_down)
	downButton1.pressed.connect(_on_button_down_1_button_up)
	add_child(downButton1)





#--------------------------[button 1 up]---------------------------------------

func _on_button_up_1_button_up() -> void:
	pass # Replace with function body.


func _on_button_up_1_button_down() -> void:
	pass # Replace with function body.

#--------------------------[button 1 down]---------------------------------------

func _on_button_down_1_button_up() -> void:
	pass # Replace with function body.


func _on_button_down_1_button_down() -> void:
	pass # Replace with function body.
