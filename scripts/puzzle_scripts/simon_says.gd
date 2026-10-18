extends Control

var shape_options = ['square', 'circle', 'triangle', 'heart']

@export var solved = false
@export var shape_solution = []
@export var color_designation = 'red'
@export var puzzle_type = "SimonSays"

@onready var ButtonSquare = $Square
@onready var ButtonCircle = $Circle
@onready var ButtonTriangle = $Triangle
@onready var ButtonHeart = $Heart

enum button {square, circle, triangle, heart}

var playerCursor:int = 0;
var sequence:Array = [];
var idle:bool = true;
var _idleChangeTimer:float = 5.0;
const _idleChangeTimerStart:float = 5.0;
const _idleChangeTimerReset:float = 3.0;

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

func _process(delta):
	if not idle:
		return;
	
	_idleChangeTimer -= delta;
	if _idleChangeTimer <= 0:
		resetGame()
		
		
		if not idle: return;

func resetGame():
	idle = true;
	_idleChangeTimer = _idleChangeTimerStart;
	playerCursor = 0
	print("RESET")

func _error():
	print("WRONG")
	idle = false 
	resetGame();

#Connected from buttons with a diferent parameter each
func _checkPlayerButton(button:int):
	if (playerCursor < sequence.size()) and sequence[playerCursor] == shape_options[button]:
		playerCursor += 1;
		_idleChangeTimer = _idleChangeTimerReset;
		print("CORRECT")
		if (playerCursor == 4):
			print("FINISH")
			solved = true
			solved_puzzle_conditions()
	else:
		_error();

func solved_puzzle_conditions() -> void:
	if solved == true:
		idle = false
		ButtonSquare.disabled = true
		ButtonTriangle.disabled = true
		ButtonCircle.disabled = true
		ButtonHeart.disabled = true

func _on_square_pressed() -> void:
	_checkPlayerButton(button.square)


func _on_triangle_pressed() -> void:
	_checkPlayerButton(button.triangle)


func _on_circle_pressed() -> void:
	_checkPlayerButton(button.circle)


func _on_heart_pressed() -> void:
	_checkPlayerButton(button.heart)
