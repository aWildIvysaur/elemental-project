extends Node

var timedict = { 
	"fire": 2000, 
	"stone": 3000, 
	"lightning": 1000, 
}

var sizedict = {
	"fire": 0.5,
	"stone": 1.0,
	"lightning": 1.5,
}

var dmultdict = {
	"fire": 0.5,
	"stone": 1.0,
	"lightning": 1.5,
}

@onready var areadict = {
		"fire": $Area2D/FireCollision ,
		"stone": $Area2D/EarthArea,
		"lightning": $Area2D/LightningCollision,
	}

@onready var area = $Area2D

@onready var spritedict = {
	"firefire": $Area2D/FireFireImage
}

var collider: CollisionPolygon2D
var time_till_damage:int
var collider_size_mult:float
var damage_mult:float
var damage_type:String
var pos_start: Vector2
var pos_end: Vector2
var image: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#queue_free()
	
func init(area_mod:String, time_mod:String, damage_mod:String, mos_pos: Vector2):
	#region Get Derivatives
	collider = areadict[area_mod]
	time_till_damage = timedict[time_mod]
	collider_size_mult = sizedict[time_mod]
	damage_mult = dmultdict[damage_mod]
	damage_type = damage_mod
	pos_end = mos_pos
	image = spritedict[area_mod + damage_mod]
	#endregion
	
	area.scale.x = 10 * collider_size_mult
	area.scale.y = 10 * collider_size_mult
	area.position 

	if area_mod == "stone":
		area.position = pos_end

