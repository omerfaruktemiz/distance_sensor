extends Node
class_name Main

onready var mob_instance = preload("res://Mob.tscn").instance()
#export (PackedScene) var Mob


# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func new_game():
	var mob_st = mob_instance
	add_child(mob_st)
	mob_st.position = Vector2(240, 120)
