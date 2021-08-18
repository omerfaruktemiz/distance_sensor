extends Area2D

var rotation_degree = 0
var dist_arr = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()

func get_dist():
	var sensor = get_node("Sensor")
	var collision_point = sensor.get_collision_point()
	var distance = position.distance_to(collision_point)
	
	return distance
	
func _physics_process(delta):
	pass

func _on_Timer_timeout():
	rotation_degrees = rotation_degree
	var dist = get_dist()
	if dist_arr.size() == 360:
		print(dist_arr)
		dist_arr.clear()
	dist_arr.append(dist)
	rotation_degree += 1
	if rotation_degree > 180:
		rotation_degree = -179
	
