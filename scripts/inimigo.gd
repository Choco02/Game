extends KinematicBody2D

const GRAVITY = 100
var motion = Vector2()


func _ready():
	
	pass

func _physics_process(delta):
	normal(delta)
	
	pass

func normal(delta):
	motion.y += GRAVITY
	#print(motion.y)
	motion = move_and_slide(motion)
	
#inimigo esperando movimentacao