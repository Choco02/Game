extends KinematicBody2D

var motion = Vector2()
var pre_tiro = preload("res://scenes/tiro_dragao.tscn")
var hp = 5
######################
var timer = 0.0####### var para medir cooldown de disparo de dragao
const time_max = 3.5##
######################
onready var current_anim = get_node("anim").current_animation

func _ready():
	add_to_group(metadados.GRUPO_INIMIGO)
	set_process(true)
	pass

func _process(delta):
	atirar(delta)
	
	pass


func atirar(delta):
	timer += delta
	#print(timer)
	if timer >= time_max:
		if current_anim != "voador_shooting":
			get_node("anim").play("voador_shooting")
		var tiro = pre_tiro.instance()
		tiro.set_global_position(get_global_position())
		get_parent().add_child(tiro)
		get_node("anim").play("voador_idle")
		timer = 0.0
		
# agora ele toma dano e-e
func damage(dano):
	hp -= dano
	if(hp <= 0):
		queue_free()
	pass
