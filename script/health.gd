extends Node
class_name Health

@export var health: int = 100

@export var hit_cooldown: float = 1.0
var last_hit: int = 0

var parent: Node

func _ready():
    parent = get_parent()

func damage(amount: int):
    var ms = Time.get_ticks_msec()
    if last_hit == 0 or ms - last_hit > hit_cooldown * 1000:
        health -= amount
        last_hit = ms
        if health <= 0:
            die()

func die():
    parent.queue_free()
