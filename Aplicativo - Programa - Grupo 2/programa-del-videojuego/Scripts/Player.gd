extends KinematicBody2D

var velocity = Vector2(0,0)
const SPEED = 300 # Velocidad que recibe la nave

var pre_bullet = preload("res://Scenes/bullet.tscn")

# Fisicas del juego
func _physics_process(delta):
	# Determinando la direccion de movimiento de la nave, añadiendo la velocidad
	if Input.is_action_pressed("D"):
		velocity.x = SPEED
	if Input.is_action_pressed("A"):
		velocity.x = -SPEED 
		
	if Input.is_action_pressed("F"):
		shoot() # Llamando directamente a la funcion de disparo
		
	# Si e valor de velocity toma algun valor distinto al de inicio, la nave genera un movimiento
	move_and_slide(velocity)
	
	velocity.x = lerp(velocity.x,0,0.1)
	
# Funcion de disparo
var readyToShoot = true
func shoot():
	if readyToShoot == true:
		var bullet = pre_bullet.instance()
		get_parent().call_deferred("add_child", bullet)
		bullet.position.x = self.position.x - 3
		bullet.position.y = self.position.y - 71
		readyToShoot = false
		$sounds/laser.play() # Cargando sonido de disparo
		yield(get_tree().create_timer(0.2), "timeout")
		readyToShoot = true
		
		

# Funcion determina si el jugador pierde (Tocar un asteroide)
func _on_Area2D_area_entered(area):
	if area.is_in_group("asteroides"):
		Global.puntos = 0 # El contador de puntos se reinicia
		get_tree().change_scene("res://Scenes/gamerOver.tscn") # Redirige a la interfaz game over
