extends WAT.Test

onready var main_scene = preload("res://Main.tscn").instance()
onready var mob_scene = preload("res://Mob.tscn").instance()

var sensor: DistanceSensor

func start():
	var game_area = main_scene
	add_child(game_area)
	var mob = mob_scene
	add_child(mob_scene)
	sensor = DistanceSensor.new()
	
func end():
	pass

func test_left_sensor_is_okay() -> void:
	var distance = sensor.get_up_dist()
	asserts.is_not_null(distance)
