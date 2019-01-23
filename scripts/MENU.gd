extends Node



func _ready():
	set_process(true)
	pass

func _process(delta):
	if Input.is_action_pressed("ENTER"):
		get_tree().change_scene("res://scenes/main.tscn")
