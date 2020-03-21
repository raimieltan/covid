extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var motion = Vector2(0,0)
	
	motion.y -= 1
	move_and_collide(motion * speed * delta)
	



func _on_Area2D_body_entered(body):
	if body.is_in_group("Enemy"):
		body.queue_free()
		queue_free()
