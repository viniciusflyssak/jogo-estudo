extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var mouse_rotation = 1

var current_hp := 5
var max_damage := 2
var coins_collected := 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("a", "d", "w", "s")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-lerp(0, mouse_rotation + 1, event.relative.x / 100))
		

func take_damage(dano):
	current_hp = current_hp - 1
	print(current_hp)
	$Label.text = "Vida: " + str(current_hp)
	if current_hp <= 0:
		die()
	
func collect_coin():
	coins_collected += 1
	print(coins_collected)	

func die():
	get_tree().reload_current_scene()


func _on_touch_screen_button_pressed():
	print("pressed")
	pass # Replace with function body.
