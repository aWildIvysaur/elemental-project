extends CharacterBody2D

const SPEED = 700
const ACCELERATION = 0.8

func _physics_process(_delta: float):
	# Normalized input vector, ensures strafing is not faster than moving forward
	var input = Input.get_vector("left", "right", "up", "down").normalized()
	# Update velocity by lerping towards (input × speed)
	velocity = lerp(velocity, input * SPEED, ACCELERATION)
	# Apply velocity
	move_and_slide()
