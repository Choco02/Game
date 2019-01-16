extends Node2D

var direcao_inicial;
var velocidade_atual;
var start_speed = 2000;

func _ready(direcao):
	set_vel(direcao, start_speed)
	set_process(true)
	pass

func _process(delta):
	set_pos(get_pos() + velocidade_atual * delta)
	pass

func set_vel(direc, speed):
	velocidade_atual = direc * speed;
	pass