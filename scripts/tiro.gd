extends Node2D

var GRAVITY = 30
var direcao_inicial = Vector2()
var velocidade_atualX = 0	# tava dando erro quando eu usava Vector2
var velocidade_atualY = 0   # então eu separei em duas variáveis 
var start_speed = 1250 #velocidade estava muito rapida, por isso nao aparecia na tela
#antes era velocidade 2000, mudada para 200


func _ready():
	set_vel(direcao_inicial, start_speed)
	set_process(true)
	pass

func _process(delta):
	rotate(0.5)
	var movimento =  Vector2(velocidade_atualX * delta , velocidade_atualY * delta )
	velocidade_atualY += GRAVITY
	global_position = global_position + movimento
	
	pass

func set_vel(direc, speed):
	print(direc)
	velocidade_atualX = direc.x * start_speed
	velocidade_atualY = direc.y * start_speed
	pass