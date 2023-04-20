extends KinematicBody2D

export var velocity = Vector2.ZERO
export var gravity = 1
export var speed = 5
export var dv= Vector2.ZERO 


func _physics_process(_delta):

	position += velocity

	velocity = move_and_slide(dv)
	if is_on_floor() == false:
		print("false")
		dv.y += gravity
	if is_on_floor() == true and dv.y != 0:
		dv.y -= 1
		print("true")
		
	
	if Input.is_action_just_pressed("jump"):
		dv.y += 40
		
