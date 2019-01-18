extends KinematicBody2D

onready var tiro = preload("res://scenes/tiro.tscn")

var hp = 1

const SPEED = 300
const GRAVITY = 30
const JUMP_HEIGHT = -700
const NORMAL = Vector2(0, -1)
var motion = Vector2() #var que modifica pos X e Y
var tempo_de_recarga = 0.5

func _ready():
	add_to_group(metadados.GRUPO_PLAYER)
	pass

func _physics_process(delta):
	_move(delta)
	pass
	
func _move(delta):
	var sprite = get_node('Sprite') #Guarda node de sprite para usar metodos
	motion.y += GRAVITY
	if Input.is_action_pressed('ui_right'):
		sprite.set_flip_h(false) #Inverte a posicao do sprite em X
		motion.x = SPEED
	elif Input.is_action_pressed('ui_left'):
		sprite.set_flip_h(true) #Invente a posicao do sprite em X
		motion.x = -SPEED
	else:
		motion.x = 0
		
	if Input.is_action_just_pressed('jump') and is_on_floor(): #jump foi uma tecla configura com valor space
		motion.y = JUMP_HEIGHT
		
		# verifica se o botão esquerdo do mouse está sendo clicado
	if Input.is_action_pressed("mouse_click") :
		# pega a posição do mouse
		var mouse_pos = get_global_mouse_position()
		# pega a posição do jogador 
		var player_pos = get_node("arma").get_global_position()
		
		# o vetor velocidade inicial tem a direção igual ao valor 
		# a subtração vetorial da posição do mouse menos a posição
		# do jogador. só um pouco de álgebra vetorial 
		var vetor_vel_inicial = mouse_pos - player_pos 
		# gera um vetor unitário na direção certa
		vetor_vel_inicial = vetor_vel_inicial.normalized()
		if tempo_de_recarga <= 0:
			var novo_tiro = tiro.instance()
			novo_tiro.direcao_inicial = vetor_vel_inicial
			get_parent().add_child(novo_tiro) #printando pos inicial de novo_tiro
			#metodos "set_global_pos" agora é "set_global_position,
			#o mesmo para "get_global_position"
			novo_tiro.set_global_position(get_node("arma").get_global_position())
			
			#novo_tiro.set_linear_velocity(Vector2(1,0)) 
			#metodo "set_linear_velocity" nao encontrado, talvez nao exista mais nessa versao
			tempo_de_recarga = 0.5
			pass
		if tempo_de_recarga > 0 :
			tempo_de_recarga -= delta
		
	
	motion = move_and_slide(motion, NORMAL)
	
	# essa fção é chamada quando o jogador toca esse inimigo 
func dano_ao_player(dano_do_inimigo):
	hp -= dano_do_inimigo
	if hp <= 0 :
		queue_free()
	pass