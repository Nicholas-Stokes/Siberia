extends Node2D

onready var killCount = $Label2
onready var message = $Label3
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	killCount.text = ("Kill Count: " + str(Global.kills))
	if Global.kills > 30:
		message.text = ("Over 30 kills? Good work Private, or should I say Corporal?")
	else:
		message.text = ("Come on Private, toughen up!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LinkButton_pressed():
	get_tree().change_scene("res://Title.tscn") # Replace with function body.
