extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var enemy = preload("res://Enemy.tscn")
var dir = 1
var speed = 250
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var motion = Vector2(0,0)
	motion.x += 1
	
	move_and_collide(motion * speed * delta * dir)

func _on_Timer_timeout():
	var e = enemy.instance()
	
	get_parent().add_child(e)
	e.add_to_group("Enemy")
	e.position = $Position2D.global_position


func _on_Area2D_body_entered(body):
	dir = 1


func _on_Area2D2_body_entered(body):
	dir = -1
