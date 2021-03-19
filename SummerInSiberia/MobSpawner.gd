extends StaticBody2D

var rng = RandomNumberGenerator.new()

var vob = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	randomize()
	vob = rng.randi_range(1,2)
	if vob == 1:
		var Butterfly = load("res://Bear.tscn")
		var butterfly = Butterfly.instance()
		var world = get_tree().current_scene
		world.add_child(butterfly)
		butterfly.global_position = global_position
	else:
		var Butterfly = load("res://Moose.tscn")
		var butterfly = Butterfly.instance()
		var world = get_tree().current_scene
		world.add_child(butterfly)
		butterfly.global_position = global_position
	# Replace with function body.
