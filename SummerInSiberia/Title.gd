extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LinkButton_pressed():
	OS.shell_open("http://plexagon.itch.io/") # Replace with function body.


func _on_LinkButton2_pressed():
	OS.shell_open("http://.youtube.com/channel/UCxbKVQZxmeAd0tal8z5rOOw/") # Replace with function body.


func _on_LinkButton3_pressed():
	OS.shell_open("http://twitter.com/plexstuff") # Replace with function body.


func _on_LinkButton4_pressed():
	get_tree().change_scene("res://Scene1.tscn") # Replace with function body.
