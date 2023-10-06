extends Area3D

@onready var player = get_node("/root/world/Character")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body == player:
		player.collect_coin()
		$anim.play("Collect")
		await get_tree().create_timer(0.5).timeout
		queue_free()
		pass # Replace with function body.
