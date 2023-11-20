extends Node2D

# Iniciando musica
func _ready():
	$music/menuMusic.play()

# Inicio del juego (Iniciar valores y guiar a la vista)
func _on_Button_pressed():
	Global.puntos = 0 # Los punto del juego se inicializan en cero
	get_tree().change_scene("res://Main.tscn")

# Accion para cuando se oprime elboton de menu
func _on_Button2_pressed():
	# Redirige a la interfaz correspondiente
	get_tree().change_scene("res://Scenes/instructions.tscn")
