extends CanvasLayer

onready var hpBar = $TextureProgress
onready var label = $Label
onready var kills = $Label2


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hpBar.set_value(Global.ivanHealth)
	label.text = ("Time Left: " + str(Global.timeLeft))
	kills.text = ("Kills: " + str(Global.kills))
	
