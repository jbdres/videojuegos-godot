extends Node

# Variables globales
var puntos = 0 # Puntos alcanzados por partida
var puntajeRecord = 0; # Puntaje maximo acanzado en todas las partidas

func playsound(sound):
	if sound == "enemyImpact": # Determiando si el sonido coincide
		get_node("/root/Main/sounds/enemyImpact").play() # Ejecutar
		
