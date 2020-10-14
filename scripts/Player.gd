extends KinematicBody2D

var vitesse = 200
var velocite = Vector2()
var dead = false
export var nb_vie = 3
export (PackedScene) var balle
onready var canon = $Canon
var speedx = 0
var speedy = 0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	get_input()
	var dir = get_global_mouse_position() - global_position
	if dir.length() > 5:
		rotation = dir.angle()
		
		var collision = move_and_collide(velocite * delta)
		if collision:
			if "Asteroid" in collision.collider.name:
				collision.collider.destroy()
				kill()
			
	if nb_vie < 1:
		dead = true
	
	if abs(velocite.x) < 0.1:
		velocite.x = 0
	else:
		velocite.x -= (speedx/5) * delta
	if abs(velocite.y) < 0.1:
		velocite.y = 0
	else:
		velocite.y -= (speedy/5) * delta
	
func get_input():
	var avance = Input.is_action_pressed("ui_up")
	var shoot = Input.is_action_just_pressed("ui_shoot")

	
	if avance:
		velocite = Vector2(vitesse, 0).rotated(rotation)
		move_and_collide(velocite/1000)
		speedx = velocite.x
		speedy = velocite.y
	if shoot:
		var b = balle.instance()
		b.creer(canon.global_position, rotation)
		get_parent().add_child(b)
	if dead:
		queue_free()
func kill():
	nb_vie = nb_vie - 1
	position.x = 786.562
	position.y = 416.507
	velocite = Vector2()

