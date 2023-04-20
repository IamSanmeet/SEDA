extends KinematicBody2D

var velocity = Vector2.ZERO
var gravity = 1
var speed = 5
var dv = Vector2.ZERO 


func _physics_process(_delta):
	position += velocity
	dv = Vector2.ZERO
	if Input.is_action_pressed("left"):
		dv.x -= speed
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.set_animation("Run")
	elif Input.is_action_pressed("right"):
		dv.x += speed
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.set_animation("Run")
	else:
		$AnimatedSprite.set_animation("Idle")
	if is_on_floor() == false:
		dv.y += gravity
		$AnimatedSprite.set_animation("Jump")
	elif is_on_floor() == true:
		dv.y = 0
	if Input.is_action_just_pressed("jump") and is_on_floor():
		dv.y -= 35
	velocity += move_and_slide(dv, Vector2.UP)
	velocity.x = clamp(velocity.x, -18, 18)
	if velocity.x > 0 and dv.x == 0:
		velocity.x -= 2
	if velocity.x < 0 and dv.x == 0:
		velocity.x += 2


func _on_Timer_timeout():
	print(velocity)
	print(is_on_floor())
