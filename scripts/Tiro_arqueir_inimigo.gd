extends Node2D

# esssa gravidade ainda deve ser ajustada
const GRAVITY = 30
const STARTSPEED = 500
var dano = 1
var direcao = Vector2()
var velocidade = Vector2()


func _ready():
	set_process(true)
	definir_velocidade()
	pass

func _process(delta):
	# vê para qual lado o tiro está indo para flipar ele ou não
	if velocidade.x > 0 :
		get_node('Sprite').set_flip_h(true)
	else:
		get_node('Sprite').set_flip_x(false)
		
	# faz o processamento em si 
	global_position = global_position + delta * velociade
	velocidade.y += GRAVITY * delta
	pass
	
func definir_velocidade():
	velocidade = STARTSPEED * direcao
	pass

func _on_Area2D_body_entered(body):
	if body is StaticBody2D :
		queue_free()
	if  body.is_in_group(metadados.GRUPO_PLAYER):
		body.dano_ao_player(dano)
		queue_free()
	pass 
