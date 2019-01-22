extends Node2D

var vel = 500

func _ready():
	set_process(true)
	pass

func _process(delta):
	set_position(get_position() + Vector2(-1, 0) * vel * delta)
	pass
