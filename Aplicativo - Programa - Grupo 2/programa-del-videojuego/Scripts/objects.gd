extends Node2D

func _ready():
	pass # Replace with function body.

func _on_Area2D_area_entered(area):
	if area.is_in_group("bullet"):
		
		# Se actualizan los puntos del jugador
		Global.puntos += 10
		
		# Si el puntaje actual de la partida, alcanza al record, este ultimo tambien ira incrementando su valor a la vez
		if Global.puntos > Global.puntajeRecord:
			Global.puntajeRecord += 10
		
		# Determinando sonidos y animaciones de impacto
		Global.playsound("enemyImpact")
		$Sprite/explosion.play("animation")
		queue_free()
