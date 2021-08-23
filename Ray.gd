extends Area2D
export var radius = 800

onready var marker = preload("res://DetectMarker.tscn")

func _physics_process(delta):
	create_rays()

func create_rays():
	var direct_space_state = get_world_2d().direct_space_state
	var dist_list = []
	
	for theta in range(0, 1441):
		theta = theta / 4
		var target_x = radius * cos(theta)
		var target_y = radius * sin(theta)
		
		var col_stat = direct_space_state.intersect_ray(position, Vector2(target_x, target_y), [self], 2147483647, true, true)
		var col_pos = col_stat.get("position")
		if col_pos != null:
			var marker_instance = marker.instance()
			add_child(marker_instance)
			marker_instance.set_global_position(col_pos)
			var dist = position.distance_to(col_pos)
			if dist < 130:
				marker_instance.color = Color(1, 0, 0, 1)
			else:
				marker_instance.color = Color(0, 1, 0, 1)
			dist_list.append(dist)
		
	print(dist_list.size())
	
