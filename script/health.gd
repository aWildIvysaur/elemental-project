extends Node
class_name Health

var health: int = 100

@export var hit_cooldown: float = 1.0
var last_hit: int = 0

func damage(amount: int):
	var ms = Time.get_ticks_msec()
	if last_hit == 0 or ms - last_hit > hit_cooldown * 1000:
		health -= amount
		last_hit = ms
