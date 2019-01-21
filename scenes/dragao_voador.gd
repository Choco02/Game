extends KinematicBody2D

var motion = Vector2()
#const DIR = Vector2(0, -1)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	motion1(delta)
	
	pass


func motion1(delta):
	motion.x = -300
	motion = move_and_slide(motion)
		
	