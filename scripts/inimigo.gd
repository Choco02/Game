extends KinematicBody2D

const GRAVITY = 100
const DISTANCIA = 200
var motion = Vector2()
var andar = 100
var ativado = 0
var direcao = 1 

var hp = 1
var dano_do_inimigo = 1


# verifica a proximidade e direção do jogador
func player_perto():
	var sprite_ini = get_node('skin_do_inimigo')
	var distancia = (get_global_position() - get_node("../player").get_global_position()).length()
	if distancia < DISTANCIA:
		ativado = 1
		if get_global_position().x - get_node("../player").get_global_position().x < 0 : 
			direcao = 1 
			sprite_ini.set_flip_h(false)
		else:
			direcao = -1
			sprite_ini.set_flip_h(true)
	else:
		ativado = 0

	
func _ready():
	add_to_group(metadados.GRUPO_INIMIGO)
	pass

func _physics_process(delta):
	mover(delta)
	
	pass


# foi adicionado dano para qundo cair 
func mover(delta):
	player_perto()
	if ativado == 1:
		motion.y += GRAVITY
		#print(motion.y)
		motion.x = andar * direcao
		motion = move_and_slide(motion)
		pass
	if get_node('pos').global_position.y > 2000 :
		damage(10)
#inimigo esperando movimentacao

# a função abaixo é chamada caso ele for atingindo por um tiro 
func damage(dano):
	hp -= dano
	if(hp <= 0):
		queue_free()
	pass

# a função abaixo é chamada quando ele atinge o player
#FUNCAO DESATIVADA TEMPORARIA, INIMIGO SENDO ATRAIDO PELO PLAYER
#INIMIGO ANDANDO MUITO MAIS RAPIDO QUE O PLAYER
#func _on_Area2D_body_entered(body):
#	if body.is_in_group(metadados.GRUPO_PLAYER):
#		body.dano_ao_player(dano_do_inimigo)
#	pass 
