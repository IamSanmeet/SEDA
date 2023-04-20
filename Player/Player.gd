extends KinematicBody2D

var velocity = Vector2.ZERO
var gravity = 50
var speed = 50
var dv = Vector2.ZERO 


func _physics_process(_delta):

	dv = Vector2.ZERO
	if Input.is_action_pressed("left"):
		dv.x -= speed
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("right"):
		dv.x += speed
		$AnimatedSprite.flip_h = false
	if is_on_floor() == false:
		dv.y += gravity

	elif is_on_floor() == true:
		velocity.y = 0
		velocity.x = lerp(velocity.x, 0, .1)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		dv.y -= 2000
	velocity += dv
	velocity.x = clamp(velocity.x, -300, 300)
	velocity = move_and_slide(velocity, Vector2.UP)
	if abs(velocity.x) < 1 and $AnimatedSprite.animation != "Idle":
		$AnimatedSprite.set_animation("Idle")
	if abs(velocity.x) >= 1 and $AnimatedSprite.animation != "Run":
		$AnimatedSprite.set_animation("Run")
	if abs(velocity.y) != 0 and $AnimatedSprite.animation != "Jump":
		$AnimatedSprite.set_animation("Jump")
		
func _on_Timer_timeout():
	print(velocity)
	print(is_on_floor())
