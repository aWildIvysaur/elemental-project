extends CharacterBody2D
class_name Player

const SPEED = 700
const ACCELERATION = 0.8

var attack = preload("res://scene/Player/player_attack.tscn")

func _physics_process(_delta: float):
	# Normalized input vector, ensures strafing is not faster than moving forward
	var input = Input.get_vector("left", "right", "up", "down").normalized()
	# Update velocity by lerping towards (input × speed)
	velocity = lerp(velocity, input * SPEED, ACCELERATION)
	# Apply velocity
	move_and_slide()
	
	if Input.is_action_just_pressed("attack"):
		var a = attack.instantiate()
		a.init("fire", "fire", "fire", position, get_global_mouse_position(), rotation)
		get_parent().add_child(a)
