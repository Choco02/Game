extends Node2D

var vel = 500

func _ready():
	set_process(true)
	pass

func _process(delta):
	set_position(get_position() * vel * delta)
	pass
