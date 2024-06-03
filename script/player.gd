extends CharacterBody2D
class_name Player

const SPEED = 700
const ACCELERATION = 0.8

var acceleration = ACCELERATION

var dash_cooldown = Cooldown.new(0)

var elem_input: ElementInput

func _ready():
	elem_input = get_node("ElementInput")

func _physics_process(_delta: float):
	# Normalized input vector, ensures strafing is not faster than moving forward
	var input = Input.get_vector("left", "right", "up", "down").normalized()
	# Update velocity by lerping towards (input × speed)
	velocity = lerp(velocity, input * SPEED, acceleration)

	# Dash
	if Input.is_action_just_pressed("dash") and dash_cooldown.done():
		velocity = velocity.normalized() * SPEED * 2.5
		# Reset acceleration
		acceleration = 0
		# Set cooldown
		dash_cooldown = Cooldown.new(0.5)

	# Apply velocity
	move_and_slide()
	
	if Input.is_action_just_pressed("attack"):
		elem_input.try_attack(get_global_mouse_position())

	# Move acceleration towards base acceleration
	if acceleration < ACCELERATION:
		acceleration += 0.03
