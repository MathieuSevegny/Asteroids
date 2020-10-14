extends KinematicBody2D
export var isDead = false
export var isBig = false
export var vitesse = 300
var velocite = Vector2()
var rot_speed
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var r = randi() % (5 - 1) + 5
	rot_speed = rad2deg(r)
	
	var angle = (randi() % 360) * PI / 180
	
	var movx = vitesse * cos(angle)
	var movy = vitesse * sin(angle)
	velocite = Vector2(movx, movy)

func _physics_process(delta):
	var collision = move_and_collide(velocite*delta)
	rotate(rot_speed/100 * delta)
	if collision:
		if "Balle" in collision.collider.name:
			destroy()
		if "Player" in collision.collider.name:
			collision.collider.kill()
			destroy()

 #Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	

func destroy():
	isDead = true
