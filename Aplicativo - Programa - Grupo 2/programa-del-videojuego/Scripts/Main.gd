extends Node2D

# Precargando escenas
var pre_asteroid = preload("res://scenes/asteroid.tscn")
var pre_asteroidMediano = preload("res://scenes/asteroidMediano.tscn")
var pre_asteroidGrande = preload("res://scenes/asteroidGrande.tscn")

func _ready(): # Musica a inciar a interfaz
	$music/mainMusic.play()

# Funcion que determina la aparicion de los obstaculos (asteroides) en el juego
func _on_Timer_timeout():
	randomize()
	var randomAsteroid = round(rand_range(1,3)) # Se determina un valo aleatorio entre 1 y 3
	
	if randomAsteroid == 1: 
		var asteroid = pre_asteroid.instance()
		self.call_deferred("add_child", asteroid)
		asteroid.position.x = round(rand_range(0,900)) # Posicion aleatoria en x para el asteroide
		asteroid.add_to_group("asteroid")
		
		
	if randomAsteroid == 2:
		var asteroidMediano = pre_asteroidMediano.instance()
		self.call_deferred("add_child", asteroidMediano)
		asteroidMediano.position.x = round(rand_range(0,900))
		asteroidMediano.add_to_group("asteroidMediano")
		
	if randomAsteroid == 3:
		var asteroidGrande = pre_asteroidGrande.instance()
		self.call_deferred("add_child", asteroidGrande)
		asteroidGrande.position.x = round(rand_range(0,900))
		asteroidGrande.add_to_group("asteroidGrande")

func _physics_process(delta):
	
	# El valor del label de la vista se cambia por el valor de los puntos
	$hud/PuntosValor.text = str(Global.puntos)
	$hud/PuntajeRecord.text = str(Global.puntajeRecord) # Actualizancion o muestra del record actual
	
	$ParallaxBackground/ParallaxLayer.motion_offset.y += 5
