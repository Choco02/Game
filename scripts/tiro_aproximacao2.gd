extends KinematicBody2D

const NORMAL = Vector2(0,-1)
var start_speed = 500
var motion = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	_move(delta)
	pass
	
func _move(delta):
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
