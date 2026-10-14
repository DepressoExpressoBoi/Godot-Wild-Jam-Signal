extends Node
class_name stopwatch

var time = 0.0

#for any pausing of the timer
var stopped = false 

func _process(delta):
	if stopped:
		return
		
	time += delta
	
funct reset():
	time = 0.0
