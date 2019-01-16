extends Node2D

var direcao_inicial
var velocidade_atual
var start_speed = 2000

func _ready(direcao):
	set_vel(direcao, start_speed)
	set_process(true)
	pass

func _process(delta):
	global_position = global_position + Vector2(velocidade_atual.x * delta, 
			velocidade_atual.y *delta)
	pass

func set_vel(direc, speed):
	velocidade_atual = Vector2(speed * direc.x, speed * direc.y)
	pass