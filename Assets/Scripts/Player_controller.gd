extends CharacterBody2D
class_name PlayerController 
@export var speed = 10.0
@export var jump_power = 10.0
#varibles
var speed_multiplier = 30.0
var jump_multiplier = -30.0
var direction = 0

#setting speed and jump so easier changing and access
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
	
	
	
	# Add the gravity.
func _process(_delta):
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_power * jump_multiplier
	
		
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)
	
	if not is_on_floor():
		velocity += get_gravity() * _delta
	move_and_slide()
