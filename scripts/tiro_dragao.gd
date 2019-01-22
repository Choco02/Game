extends Node2D

var vel = 500
var dano = 1
var direcao = 1

func _ready():
	set_process(true)
	pass

func _process(delta):
	if direcao == -1 :
		get_node('Sprite').set_flip_h(true)
	else:
		get_node('Sprite').set_flip_h(false)
	set_position(get_position() + Vector2(-1 * direcao, 0) * vel * delta)
	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group(metadados.GRUPO_PLAYER):
		body.dano_ao_player(dano)
		queue_free()
	if body is StaticBody2D:
		queue_free()
	pass # replace with function body
