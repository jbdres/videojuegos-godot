extends Node2D

# Iniciando musica
func _ready():
	$music/menuMusic.play()

# Redireccion a la interfaz de menu
func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/menu.tscn")
