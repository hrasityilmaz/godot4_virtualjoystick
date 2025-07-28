extends CanvasLayer

@onready var knob = $Control/BG/Inner
var joystick_index = -1
var joystick_center
var joystick_vector
var joystick_vector_normalized

func _ready():
	joystick_center = knob.global_position
	
func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			if Input.is_action_just_pressed("joystick_action"):
				joystick_index = event.index
		else:
			if Input.is_action_just_released("joystick_action"):
				joystick_index = -1
				knob.global_position = joystick_center
	if event is InputEventScreenDrag:
		if event.index == joystick_index:
			joystick_vector = event.position - joystick_center
			joystick_vector_normalized = joystick_vector.normalized()
			knob.global_position = joystick_center + joystick_vector.limit_length(50)
			

