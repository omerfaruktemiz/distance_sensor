extends Area2D

var rotation_degree = 0
var dist_arr = []

# Called when the node enters the scene tree for the first time.
func _ready():
	#$Timer.start()
	pass

func get_dist():
	var sensor = get_node("Sensor")
	var collision_point = sensor.get_collision_point()
	var distance = position.distance_to(collision_point)
	
	print(distance)
	
func _physics_process(delta):
	#get_dist()
	create_rays()

"""
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
"""

func create_rays():
	var direct_space_state = get_world_2d().direct_space_state
	
	var up_dist_list = []
	var left_dist_list = []
	var right_dist_list = []
	var down_dist_list = []
	
	# Variables for calculating upside, downside, leftside and rightside distance values
	var col_stat
	var col_pos
	var dist
	
	# Calculating upside and downside distance values 
	for i in range(0, 481):
		col_stat = direct_space_state.intersect_ray(position, Vector2(i, 0), [self], 2147483647, true, true)
		col_pos = col_stat.get("position")
		if col_pos != null:
			dist = position.distance_to(col_pos)
			up_dist_list.append(dist)
			
		col_stat = direct_space_state.intersect_ray(position, Vector2(i, 720), [self], 2147483647, true, true)	
		col_pos = col_stat.get("position")
		if col_pos != null:
			dist = position.distance_to(col_pos)
			down_dist_list.append(dist)
	
	# Calculating leftside and rightside distance values
	for i in range(1, 721):
		col_stat = direct_space_state.intersect_ray(position, Vector2(0, i), [self], 2147483647, true, true)
		col_pos = col_stat.get("position")
		if col_pos != null:
			dist = position.distance_to(col_pos)
			left_dist_list.append(dist)
			
		col_stat = direct_space_state.intersect_ray(position, Vector2(480, i), [self], 2147483647, true, true)
		col_pos = col_stat.get("position")
		if col_pos != null:
			dist = position.distance_to(col_pos)
			right_dist_list.append(dist)
	
	print(up_dist_list)
	#print(left_dist_list.size())
	#print(down_dist_list.size())
	#print(right_dist_list.size())
	
	
