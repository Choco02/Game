extends KinematicBody2D

const NORMAL = Vector2(0,-1)
const GRAVITY = 30
var start_speed = 500
var motion = Vector2()
var angle

func _ready(angulo):
	angle = angulo
	motion.y = start_speed * sin(angle)
	motion.x = start_speed * sin(angle)
	print("entrou no tiro")
	pass

func _physics_process(delta):
	_move(delta)
	pass
	
func _move(delta):
	motion.y += GRAVITY
	
	motion = move_and_slide(motion, NORMAL)
	pass


