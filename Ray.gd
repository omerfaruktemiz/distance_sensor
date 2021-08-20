extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _physics_process(delta):
	create_rays()

func create_rays():
	var direct_space_state = get_world_2d().direct_space_state
	var dist_list = []
	
	"""
	var up_dist_list = []
	var left_dist_list = []
	var right_dist_list = []
	var down_dist_list = []
	"""
	# Variables for calculating upside, downside, leftside and rightside distance values
	var col_stat
	var col_pos
	var dist
	
	var radius = 800
	
	for theta in range(0, 1441):
		theta = theta / 2
		var target_x = radius * cos(theta)
		var target_y = radius * sin(theta)
		
		col_stat = direct_space_state.intersect_ray(position, Vector2(target_x, target_y), [self], 2147483647, true, true)
		col_pos = col_stat.get("position")
		if col_pos != null:
			dist = position.distance_to(col_pos)
			dist_list.append(dist)
		
	print(dist_list.size())	
	
	"""
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
	"""
	
