extends Node
class_name stopwatch

var time = 0.0

#for any pausing of the timer
var stopped = false 

func _process(delta):
	if stopped:
		return
	time += delta
	
func reset():
	time = 0.0

func time_to_string() -> String:
	#turn the time var into a str for the UI
	var msec = fmod(time, 1) * 1000
	var sec = fmod(time, 60)
	var min = time / 60
	var format_string = "%02d : %02d : %02d"
	var actual_string = format_string % [min, sec, msec]
	return actual_string
