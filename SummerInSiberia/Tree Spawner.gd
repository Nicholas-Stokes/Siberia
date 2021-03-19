extends Node2D

func _ready():
	var Butterfly = load("res://PineTree.tscn")
	var butterfly = Butterfly.instance()
	var world = get_tree().current_scene
	world.add_child(butterfly)
	butterfly.global_position = global_position
