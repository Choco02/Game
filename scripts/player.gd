extends KinematicBody2D

const SPEED = 300
const GRAVITY = 30
const JUMP_HEIGHT = -700
const NORMAL = Vector2(0, -1)
var motion = Vector2() #var que modifica pos X e Y

func _ready():

	pass

func _physics_process(delta):
	_move(delta)
		
		
func _move(delta):
	motion.y += GRAVITY
	if Input.is_action_pressed('ui_right'):
		motion.x = SPEED
	elif Input.is_action_pressed('ui_left'):
		motion.x = -SPEED
	else:
		motion.x = 0
		
	if Input.is_action_just_pressed('jump') and is_on_floor(): #jump foi uma tecla configura com valor space
		motion.y = JUMP_HEIGHT
	motion = move_and_slide(motion, NORMAL)