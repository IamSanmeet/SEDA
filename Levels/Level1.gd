extends Node2D


func _physics_process(delta):
	$Camera2D.postition = $Player.position
