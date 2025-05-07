extends CharacterBody2D
class_name player_controller
@onready var sprite = $AnimatedSprite2D
#const SPEED = 150
#const JUMP_VELOCITY = -250
@export var speed = 10
@export var jump_power = 10

var speed_mult = 15
var jump_mult = -25
var direction = 0
#speed & jump multipliers, adjust these to give speed boost
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_power * jump_mult

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	print(direction)
	direction = Input.get_axis("Move-left", "Move-right")
	if direction:
		velocity.x = direction * speed * speed_mult
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_mult)
	if direction <0:
		sprite.play = 
		sprite.flip_h = true
	elif direction>0:
		sprite.flip_h = false
	move_and_slide()
