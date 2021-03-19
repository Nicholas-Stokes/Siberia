extends KinematicBody2D

var velocity = Vector2(0, 0)
const ACCELERATION = 5
var speed = 10
var direction = 0

var angle = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	global_position = Global.ivanPosition
	if Global.ivanWalk == 1:
		rotation_degrees = 180
	if Global.ivanWalk == 2:
		rotation_degrees = 0
	if Global.ivanWalk == 1:
		direction = Vector2(-100,0)
	else:
		direction = Vector2(100, 0)
	# Replace with function body.
	
func _process(_delta):
	randomize()
	velocity = velocity.move_toward(direction * speed, ACCELERATION)
	velocity = move_and_slide(velocity)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	queue_free()# Replace with function body.


func _on_Hitbox_area_entered(area):
	queue_free() # Replace with function body.
