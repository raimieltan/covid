extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 200
var motion = Vector2(0,0)
var alcohol = preload("res://Alcohol.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	

	if Input.is_action_pressed("ui_left"):
		motion.x -= 1
	if Input.is_action_pressed("ui_right"):
		motion.x += 1
	
	if Input.is_action_just_pressed("ui_accept"):
		var bullet = alcohol.instance()
		get_parent().add_child(bullet)
		bullet.position = $Position2D.global_position
		
	motion = motion.normalized()
	move_and_collide(motion * speed * delta)




func _on_TouchScreenButton_pressed():
		var bullet = alcohol.instance()
		get_parent().add_child(bullet)
		bullet.position = $Position2D.global_position


func _on_Right_pressed():
	motion.x += 1
