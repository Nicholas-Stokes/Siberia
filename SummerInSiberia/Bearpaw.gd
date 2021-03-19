extends KinematicBody2D


var velocity = Vector2(0, 0)
const ACCELERATION = 20
var speed = 180
var direction = 0
var target = Vector2(0,0)

var angle = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	target = Global.ivanPosition
	# Replace with function body.
	
func _process(_delta):
	target = Global.ivanPosition
	direction = global_position.direction_to(target)
	velocity = velocity.move_toward(direction * speed, ACCELERATION)
	velocity = move_and_slide(velocity)


func _on_Timer_timeout():
	queue_free()


func _on_Hitbox_area_entered(area):
	Global.ivanHealth = Global.ivanHealth - 15 # Replace with function body.
