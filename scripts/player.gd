extends KinematicBody2D

var tiro = preload("res://scenes/tiro.tscn")

const SPEED = 300
const GRAVITY = 30
const JUMP_HEIGHT = -700
const NORMAL = Vector2(0, -1)
var motion = Vector2() #var que modifica pos X e Y

func _ready():

	pass

func _physics_process(delta):
	_move(delta)
		
		
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
		print("mouse clicado")
		# pega a posição do mouse
		var mouse_pos = get_viewport().get_mouse_position()
		print(mouse_pos)
		
		# gera um vetor unitário na direção 
		mouse_pos = mouse_pos / mouse_pos.normalized()
		
		var novo_tiro = tiro.instance()
		novo_tiro.set_global_pos(get_node("player/arma").get_global_position())
		get_node("res://scenes/main").add_child(novo_tiro)
		pass
	
	motion = move_and_slide(motion, NORMAL)