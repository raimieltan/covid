extends KinematicBody2D

const MOVE_SPEED = 200

onready var raycast = $RayCast2D
var player_visible
var player = null

func _ready():
	add_to_group("zombies")

func _physics_process(delta):
	if player == null:
		return
	
	if(player_visible):
		var vec_to_player = player.global_position - global_position
		vec_to_player = vec_to_player.normalized()
		global_rotation = atan2(vec_to_player.y, vec_to_player.x)
		get_node("Area2D/CollisionShape2D").scale.x = 3
		get_node("Area2D/CollisionShape2D").scale.y = 3
		move_and_collide(vec_to_player * MOVE_SPEED * delta)
	
	if raycast.is_colliding():
		var coll = raycast.get_collider()
		if coll.name == "Player":
			coll.kill()

func kill():
	queue_free()

func set_player(p):
	player = p


func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		player_visible = true



func _on_Area2D_body_exited(body):
	if(body.name == "Player"):
		player_visible = false
		get_node("Area2D/CollisionShape2D").scale.x = 1
		get_node("Area2D/CollisionShape2D").scale.y = 1
