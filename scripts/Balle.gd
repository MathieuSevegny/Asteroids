extends KinematicBody2D

var vitesse = 500
var velocite = Vector2()



func creer(pos,dir):
	position = pos
	velocite = Vector2(vitesse,0).rotated(dir)
	

func _physics_process(delta):
	var collision = move_and_collide(velocite*delta)
	if collision:
		if "Asteroid" in collision.collider.name:
			collision.collider.destroy()
			queue_free()
	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
