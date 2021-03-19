extends StaticBody2D

onready var timer = $Timer

var numberOfTrees = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if numberOfTrees > 100:
		queue_free()


func _on_Timer_timeout():
	randomize()
	global_position = Vector2(rand_range(-600,600),rand_range(-200,600))
	var Butterfly = load("res://PineTree.tscn")
	var butterfly = Butterfly.instance()
	var world = get_tree().current_scene
	world.add_child(butterfly)
	butterfly.global_position = global_position
	numberOfTrees = numberOfTrees + 1 # Replace with function body.
