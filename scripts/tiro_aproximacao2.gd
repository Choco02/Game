extends KinematicBody2D

const NORMAL = Vector2(0,-1)
const GRAVITY = 30
var start_speed = 5
var motion = Vector2()
var angle
var distancia = 0
var direc = 1

func _ready():
	motion.y = 600
	motion.x = start_speed * direc
	print("entrou no tiro")
	pass

func _physics_process(delta):
	_move(delta)
	pass
	
func _move(delta):
	var textura = get_node('sprite')
	motion.y += GRAVITY
	distancia += motion.x * delta
	motion = move_and_slide(motion, NORMAL)
	if distancia  > 1000 :
		textura.set_
	

	pass

