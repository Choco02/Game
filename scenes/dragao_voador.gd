extends KinematicBody2D

var motion = Vector2()
var pre_tiro = preload("res://scenes/tiro_dragao.tscn")
var hp = 3
var direcao = 1
var distancia = 0
######################
var timer = 0.0####### var para medir cooldown de disparo de dragao
const time_max = 5.0##
######################
onready var current_anim = get_node("anim").current_animation

func _ready():
	add_to_group(metadados.GRUPO_INIMIGO)
	set_process(true)
	pass

func _process(delta):
	motion1(delta)
	time(delta)
	
	pass


func motion1(delta):
	var textura = get_node('Sprite')
	
	motion.x = -100 * direcao
	distancia += motion.x * delta
	# alguma melhoria nos doragons
	motion = move_and_slide(motion)
	
	if distancia < -1000 : 
		textura.set_flip_h(true)
		direcao = -1
	if distancia > 0: 
		textura.set_flip_h(false)
		direcao = 1
	
	pass

func time(delta):
	timer += delta
	#print(timer)
	if timer >= time_max:
		#if current_anim == "voador_idle":
		#	print("shooting acabou")
		#	get_node("anim").play("voador_idle")
		var tiro = pre_tiro.instance()
		tiro.direcao = direcao
		tiro.set_global_position(get_global_position())
		get_parent().add_child(tiro)
		timer = 0.0
		
# agora le toma dano e-e
func damage(dano):
	hp -= dano
	if(hp <= 0):
		queue_free()
	pass