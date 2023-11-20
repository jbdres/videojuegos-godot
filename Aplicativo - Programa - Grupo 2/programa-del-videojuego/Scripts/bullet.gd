extends KinematicBody2D

func _physics_process(delta):
	position.y -= 10
	
func _on_Area2D_area_entered(area):
	if area.is_in_group("asteroides"):
		queue_free()
