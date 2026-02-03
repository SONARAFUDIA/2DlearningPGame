extends CharacterBody2D
class_name PlayerController

@export var walk_speed: int = 5
@export var jump: int = 10

var speed_multiplier: int = 25
var jump_multiplier: int = -25
var direction: int = 0

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
func _input(event):
	# Handle jump.
	if event.is_action_pressed("Jump") and is_on_floor():
		velocity.y = jump * jump_multiplier
	
	if event.is_action_pressed("Down"):
		set_collision_mask_value(10, false)
	else:
		set_collision_mask_value(10, true)
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Mov_Left", "Mov_Right")
	
	if Input.is_action_just_pressed("Run"):
		walk_speed = 20
	elif Input.is_action_just_released("Run"):
		walk_speed = 5
	
	if direction:
		velocity.x = direction * walk_speed * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, walk_speed * speed_multiplier)

	
	move_and_slide()
