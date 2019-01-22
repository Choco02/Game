extends KinematicBody2D

const GRAVITY = 30
var motion = Vector2()

func _ready():

	pass

func _physics_process(delta):
	movimento(delta)
	atirar()
	pass

func movimento(delta):
	motion.y += GRAVITY
	motion = move_and_slide(motion)
	pass
	
func atirar():
	var jogador = get_node("../player")
	var dif_pos = (jogador.global_position - global_position).abs()
	var angulo = atan((sqrt((pow(dif_pos.x, 2)) + 4 * dif_pos.y - 2*(-GRAVITY)*(pow(dif_pos.x, 2))/(pow(STARTSPEED, 2)))-dif_pos.x)/
	 ((-GRAVITY)*(pow(dif_pos.x, 2))/(pow(STARTSPEED, 2))))
	var direcao_tiro = Vector2()
	
	pass