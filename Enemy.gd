extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
var speed = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var motion = Vector2(0,0)
	
	motion.y += 1
	
	move_and_collide(speed * motion * delta)
	