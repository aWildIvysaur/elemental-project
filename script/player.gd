extends CharacterBody2D
class_name Player

const Cooldown = preload ("res://script/cooldown.gd")

const SPEED = 700
const ACCELERATION = 0.8

var acceleration = ACCELERATION
var attack = load("res://scene/Player/player_attack.tscn")

var dash_cooldown = Cooldown.new(0)

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
		make_attack("fire", "fire", "fire")

	# Move acceleration towards base acceleration
	if acceleration < ACCELERATION:
		acceleration += 0.03
	
func make_attack(element1: String, element2: String, element3: String):
	var a = attack.instantiate()
	if element1 == "fire":
		add_child(a)
	else:
		get_parent().add_child(a)
	a.init(element1, element2, element3, get_global_mouse_position())
