extends Node2D

# Funcion que reproduce la musica correspondiente a la terimnacion del juego
func _ready():
	$music/musicOver.play()
	
# Accion para el boton de la interfaz
func _on_Button_pressed():
	# Redirige a la pantalla de menu
	get_tree().change_scene("res://Scenes/menu.tscn")
