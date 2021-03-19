extends KinematicBody2D


onready var timer = $Timer
var targetPosition = Vector2(0,0)
var velocity = Vector2(0,0)
var speed = 40
const ACCELERATION = 40
var attacking = 0
var startPosition = Vector2(0,0)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	targetPosition = Global.ivanPosition
	if attacking == 1:
		targetPosition = Global.ivanPosition
		var direction = global_position.direction_to(targetPosition)
		velocity = velocity.move_toward(direction * speed, ACCELERATION)
		velocity = move_and_slide(velocity) 
	if attacking == 0:
		velocity = Vector2.ZERO
		
func _on_Timer_timeout():
	var Butterfly = load("res://Bearpaw.tscn")
	var butterfly = Butterfly.instance()
	var world = get_tree().current_scene
	world.add_child(butterfly)
	butterfly.global_position = global_position
	timer.start()
	


func _on_Area_of_Effect_area_entered(area):
	attacking = 1
	print("attacking")
	timer.start()
	 # Replace with function body.



func _on_Area_of_Effect_area_exited(area):
	attacking = 0
	print("idle")
	timer.stop()


func _on_Hurtbox_area_entered(area):
	Global.kills = Global.kills + 1
	queue_free() # Replace with function body.
