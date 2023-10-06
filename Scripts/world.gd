extends Node3D
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$CameraHub.rotate_y(0.02)
	pass

func _unhandled_input(event):
	if event is InputEventKey:
		if (Input.is_action_just_pressed("esc")) && (Input.mouse_mode == Input.MOUSE_MODE_CAPTURED):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			if (Input.is_action_just_pressed("esc")):
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
		
