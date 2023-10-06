extends CharacterBody3D

const UP = Vector3.UP

var enemy_hp := 5
var damage := 1

var attackDistance := 1.2
var attackRate := 1.0
var enemySpeed := 1.0

@onready var timer := $AttackTimer as Timer
@onready var player = get_node("/root/world/Character")

func _ready():
	timer.wait_time = attackRate
	timer.start()
	velocity = Vector3.ZERO

func _physics_process(delta):
	var distance = position.distance_to(player.position)
	var direction = (player.position - position).normalized()		
	
	if get_slide_collision_count() > 0:		
		velocity = Vector3.ZERO		
	else:
		if distance > attackDistance:			
			velocity = Vector3(direction.x, 0, direction.z)		
			move_and_slide()

func take_damage(damage):
	enemy_hp -= damage
	if enemy_hp <= 0:
		die()
	
func die():
	queue_free()


func _on_attack_timer_timeout():
	if position.distance_to(player.position) <= attackDistance:
		player.take_damage(damage)
	pass # Replace with function body.
