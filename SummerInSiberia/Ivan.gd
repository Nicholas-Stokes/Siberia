extends KinematicBody2D
onready var animation = $AnimationPlayer
onready var animationTree = $AnimationTree
const ACCELERATION = 700
const MAX_SPEED = 150
const FRICTION = 700

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2.ZERO
onready var timer = $Timer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("Idle")
	Global.kills = 0
	Global.ivanHealth = 300# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Global.timeLeft = int(round(timer.time_left))
	Global.ivanPosition = global_position
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y= Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_pressed("shoot"):
		var Butterfly = load("res://Bullet.tscn")
		var butterfly = Butterfly.instance()
		var world = get_tree().current_scene
		world.add_child(butterfly)
		butterfly.global_position = global_position
		Global.ivanPosition = global_position
	if Input.is_action_pressed("walkLeft"):
		animation.play("RunLeft")
		Global.ivanWalk = 1
	if Input.is_action_pressed("walkRight"):
		animation.play("RunRight")
		Global.ivanWalk = 2
	if (Input.is_action_just_released("walkLeft") or Input.is_action_just_released("walkRight")):
		animation.play("Idle")


func _on_Hurtbox_area_entered(area):
	if Global.ivanHealth <= 0:
		get_tree().change_scene("res://Title.tscn")


func _on_Timer_timeout():
	get_tree().change_scene("res://Win.tscn") # Replace with function body.
