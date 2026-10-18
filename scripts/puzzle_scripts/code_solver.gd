extends Control

var shape_options = ['moon', 'circle', 'triangle', 'fork3', 'heart', 'pentagon', 'square', 'star', 'fork4']

@export var solved = false
@export var shape_solution = []
@export var color_designation = 'red'
@export var puzzle_type = "CodeSolver"

@onready var ButtonMoon = $Moon
@onready var ButtonCircle = $Circle
@onready var ButtonTriangle = $Triangle
@onready var ButtonFork3 = $Fork3
@onready var ButtonHeart = $Heart
@onready var ButtonPentagon = $Pentagon
@onready var ButtonSquare = $Square
@onready var ButtonStar = $Star
@onready var ButtonFork4 = $Fork4


enum button {moon, circle, triangle, fork3, heart, pentagon, square, star, fork4}

var playerCursor:int = 0;
var sequence:Array = [];

func _ready() -> void:
	create_shape_solution()
	sequence = shape_solution
	print(shape_solution)
	#Set the player sequence at the begining
	playerCursor = 0;

func create_shape_solution() -> void:
	var shape_options_copy = shape_options.duplicate()
	shape_options_copy.shuffle()
	for x in 4:
		shape_solution.append(shape_options_copy.pop_back())

func _error():
	print("WRONG")
	resetGame();
	
func resetGame():
	playerCursor = 0
	print("RESET")


#Connected from buttons with a diferent parameter each
func _checkPlayerButton(button:int):
	if (playerCursor < sequence.size()) and sequence[playerCursor] == shape_options[button]:
		playerCursor += 1;
		print("CORRECT")
		if (playerCursor == 4):
			print("FINISH")
			solved = true
			solved_puzzle_conditions()
	else:
		_error();
		
func solved_puzzle_conditions() -> void:
	if solved == true:
		ButtonMoon.disabled = true
		ButtonCircle.disabled = true
		ButtonTriangle.disabled = true
		ButtonFork3.disabled = true
		ButtonHeart.disabled = true
		ButtonPentagon.disabled = true
		ButtonSquare.disabled = true
		ButtonStar.disabled = true
		ButtonFork4.disabled = true

func _on_moon_pressed() -> void:
	_checkPlayerButton(button.moon)

func _on_circle_pressed() -> void:
	_checkPlayerButton(button.circle)

func _on_triangle_pressed() -> void:
	_checkPlayerButton(button.triangle)

func _on_fork_3_pressed() -> void:
	_checkPlayerButton(button.fork3)

func _on_heart_pressed() -> void:
	_checkPlayerButton(button.heart)

func _on_pentagon_pressed() -> void:
	_checkPlayerButton(button.pentagon)

func _on_square_pressed() -> void:
	_checkPlayerButton(button.square)

func _on_star_pressed() -> void:
	_checkPlayerButton(button.star)

func _on_fork_4_pressed() -> void:
	_checkPlayerButton(button.fork4)
