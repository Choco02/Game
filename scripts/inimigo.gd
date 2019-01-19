extends KinematicBody2D

const GRAVITY = 100
var motion = Vector2()
var andar = 100

var hp = 1
var dano_do_inimigo = 1

func _ready():
	add_to_group(metadados.GRUPO_INIMIGO)
	pass

func _physics_process(delta):
	normal(delta)
	
	pass


# foi adicionado dano para qundo cair 
func normal(delta):
	motion.y += GRAVITY
	#print(motion.y)
	motion.x = andar
	#var sprite = get_node('Sprite')
	if get_node('pos').global_position.y > 2000 :
		damage(10)
	motion = move_and_slide(motion)
	
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
