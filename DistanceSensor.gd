extends Area2D

var sensor_range = 240

func _ready():
	#_set_ranges()
	pass

func _set_ranges():
	# TODO: setting ranges according to its direction 
	#$Ray.cast_to = Vector2(0, -sensor_range)
	pass

	
func get_dist():
	var sensor = get_node("Ray")
	var collision_point = sensor.get_collision_point()
	var dist = position.distance_to(collision_point)
	
	return collision_point
	
func _physics_process(delta):
	get_dist()
