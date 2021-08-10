extends Area2D

var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	pass
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
