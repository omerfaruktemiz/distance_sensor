extends Node

onready var mob_instance = preload("res://Mob.tscn")
onready var sensor_instance = preload("res://DistanceSensor.tscn")
#export (PackedScene) var Mob

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func new_game():
	var positions = [Vector2(240, 120), Vector2(240, 600), Vector2(80, 360), Vector2(400, 360)]
	var cast_coordinates = [Vector2(240, 0), Vector2(240, 720), Vector2(0, 360), Vector2(480, 360)]
	var rotations = [0, 90, 180, -90]
	var sensor_results = []
	
	for i in positions:
		var mob = mob_instance.instance()
		add_child(mob)
		mob.position = i
	
	for i in range(4):
		var sensor = sensor_instance.instance()
		add_child(sensor)
		var ray = sensor.get_node("Ray")
		ray.cast_to = cast_coordinates[i]
		sensor.position = Vector2(240, 360)
		sensor_results.append(sensor.get_dist())
		
	print(sensor_results)
	
	
	
