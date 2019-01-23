extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("../../").connect("hp_change", self, "_on_player_hp_change")
	get_node('um').visible = false
	get_node('dois').visible = false
	get_node('tres').visible = true
	get_node('morto').visible = false
	get_node('texto').visible = false
	pass

func _on_player_hp_change(hp):
	if hp == 1 :
		get_node('um').visible = true
		get_node('dois').visible = false
		get_node('tres').visible = false
		get_node('morto').visible = false
	if hp == 2 :
		get_node('um').visible = false
		get_node('dois').visible = true
		get_node('tres').visible = false
		get_node('morto').visible = false
		get_node('texto').visible = false
	if hp == 3 :
		get_node('um').visible = false
		get_node('dois').visible = false
		get_node('tres').visible = true
		get_node('morto').visible = false
		get_node('texto').visible = false
	if hp <= 0 :
		get_node('um').visible = false
		get_node('dois').visible = false
		get_node('tres').visible = false
		get_node('morto').visible = true
		get_node('texto').visible = true
	pass
	