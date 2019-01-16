extends Node2D


var direcao_inicial
var velocidade_atual
var start_speed = 200 #velocidade estava muito rapida, por isso nao aparecia na tela
#antes era velocidade 2000, mudada para 200


func _ready(direcao):
	print(direcao)
	set_vel(direcao, start_speed)
	set_process(true)
	pass

func _process(delta):
	global_position = global_position + start_speed * Vector2(1,0)
	pass

func set_vel(direc, speed):
	velocidade_atual = Vector2(speed * sin(direc), speed * cos(direc))
	pass