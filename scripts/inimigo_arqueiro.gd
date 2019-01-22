extends KinematicBody2D

const GRAVITY = 30
var motion = Vector2()
var hp = 1
const STARTSPEED = 500
var tempo_de_recarga = 2
var dire = 1

var tiros = preload("res://scenes/tiro_arqueir_inimigo.tscn")

func _ready():
	add_to_group(metadados.GRUPO_INIMIGO)
	pass

func _physics_process(delta):
	movimento(delta)
	tempo_de_recarga -= delta
	if tempo_de_recarga < 0 :
		atirar()
		tempo_de_recarga = 2
	pass

func movimento(delta):
	motion.y += GRAVITY
	motion = move_and_slide(motion)
	pass
	
func atirar():
	var jogador = get_node("../player")
	var dif_pos = jogador.global_position - global_position
	
	if dif_pos.x < 0:
		dire = -1
		get_node("Sprite").set_flip_h(false)
	else:
		dire = 1
		get_node("Sprite").set_flip_h(true)
		
	var angulo = PI / 4 
	var direcao_tiro = Vector2( dire * cos(angulo), - sin(angulo))
	var tiro = tiros.instance()
	
	
	
	tiro.direcao = direcao_tiro
	tiro.global_position = global_position
	get_parent().add_child(tiro)
	pass
	
func damage(dano):
	hp -= dano
	if hp <= 0 : 
		queue_free()