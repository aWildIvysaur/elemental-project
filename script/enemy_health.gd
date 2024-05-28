extends Node
class_name EnemyHealth

var health: int = 100

func damage(amount: int):
	health -= amount
