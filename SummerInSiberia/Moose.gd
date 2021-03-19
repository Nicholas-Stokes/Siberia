extends KinematicBody2D
onready var animation = $AnimatedSprite
var targetPosition = Vector2(0,0)
var velocity = Vector2(0,0)
var speed = 100
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
		animation.play("Angry")
		targetPosition = Global.ivanPosition
		var direction = global_position.direction_to(targetPosition)
		velocity = velocity.move_toward(direction * speed, ACCELERATION)
		velocity = move_and_slide(velocity) # Replace with function body.
	if attacking == 0:
		animation.play("Idle")
		velocity = Vector2.ZERO
	
	
	


func _on_Area_of_Effect_area_entered(area):
	attacking = 1
	print("attacking") # Replace with function body.



func _on_Area_of_Effect_area_exited(area):
	attacking = 0
	print("idle")
	# Replace with function body.


func _on_Hurtbox_area_entered(area):
	Global.kills = Global.kills + 1
	queue_free() # Replace with function body.


func _on_Hitbox_area_entered(area):
	Global.ivanHealth = Global.ivanHealth - 35 # Replace with function body.
