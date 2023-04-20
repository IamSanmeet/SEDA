extends KinematicBody2D

var velocity = Vector2.ZERO
var gravity = 0 
var speed = 5
var dv= Vector2.ZERO 


func _physics_process(_delta):
	velocity +=dv
	velocity.y+=gravity
	if is_on_floor():
		velocity.y=0
	if velocity != Vector2.ZERO:
		velocity = move_and_slide(velocity)
		
