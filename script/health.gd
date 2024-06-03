extends Node
class_name Health

@export var health: int = 100

var next_hit: int = 0

var parent: Node

enum AttackKind {
	fire,
	stone,
	lightning,
	normal,
}
	

func _ready():
	parent = get_parent()

func damage(amount: int, type: String, invul_time: int):
	var ms = Time.get_ticks_msec()
	health -= amount
	next_hit = ms + invul_time
	if health <= 0:
		die()
		
func get_hit_CD():
	return next_hit <= Time.get_ticks_msec()

func die():
	parent.queue_free()
