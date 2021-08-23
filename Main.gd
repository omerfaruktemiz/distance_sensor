extends Node

onready var mob_instance = preload("res://Mob.tscn")
onready var sensor_instance = preload("res://Ray.tscn")

var mob_positions = [Vector2(240, 120), Vector2(240, 600), Vector2(80, 360), Vector2(400, 360)]
var i = 0

func _ready():
	new_game()
	
func new_game():
	for i in mob_positions:
		var mob = mob_instance.instance()
		add_child(mob)
		mob.position = i
	
	var sensor = sensor_instance.instance()
	add_child(sensor)
	sensor.position = Vector2(240, 360)
