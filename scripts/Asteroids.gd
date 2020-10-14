extends Node
var asteroids = []
var bigasteroid = preload("res://Scenes/BigAsteroid.tscn")
var smallasteroid = preload("res://Scenes/SmallAsteroid.tscn")
var explosion = preload("res://Scenes/Explosion.tscn")
var playerposx = 786.562
var playerposy = 416.507
var score = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	_check_if_died()

func _add_asteroid(var isBig, var pos,var angle):
	var newAsteroid
	if !isBig:
		newAsteroid = smallasteroid.instance()
	else:
		newAsteroid = bigasteroid.instance()
		newAsteroid.isBig = true
	newAsteroid.position = pos
	add_child(newAsteroid)
	asteroids.append(newAsteroid)

func _check_if_died():
	for asteroid in asteroids :
		if asteroid.isDead:
			score = score + 20
			var explosionx = asteroid.position.x
			var explosiony = asteroid.position.y
			var newexplosion = explosion.instance()
			newexplosion.position = Vector2(explosionx,explosiony)
			if asteroid.isBig:
				newexplosion.scale = Vector2(3,3)
				var x = asteroid.position.x
				var y = asteroid.position.y
				if x <= 40:
					x = 1500
				if x >= 1530:
					x = 50
				if y <= 40:
					y = 900
				if y >= 900:
					y = 50
				_add_asteroid(false,Vector2(x, y), 0)
				_add_asteroid(false,Vector2(x, y), 180)
			add_child(newexplosion)
			remove_child(asteroid)
			asteroids.erase(asteroid)
			
func _get_pos():
	var x
	var y
	var distance = 150
	var isOkay = false
	while !isOkay:
		x = randi() % (1500 - 50) + 50 
		y = randi() % (850 - 50) + 50
		if x > playerposx + distance || x < playerposx - distance:
			if y > playerposy + distance || y < playerposy - distance:
				isOkay = true
	return Vector2(x,y)
