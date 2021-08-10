extends Area2D
class_name DistanceSensor

export var up_sensor_range = 240
export (String, "Only Areas", "Only Bodies", "Areas and Bodies") var up_sensor_collision_status

func _ready():
	_set_ranges()

func _set_ranges():
	$UpSensor.cast_to = Vector2(0, -up_sensor_range)
	
func get_up_dist():
	var up_sensor = get_node("UpSensor")
	var up_collision_point = up_sensor.get_collision_point()
	var dist = position.distance_to(up_collision_point)
	print(dist)
	
func _physics_process(delta):
	get_up_dist()
