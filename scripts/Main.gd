extends Node
onready var lvl = 1
export onready var vie = 3
var counter = 0
var enemies_counter
var isFinished = false
var cursor = load("res://assets/cursor/cursor.png")



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$UI/Dead.visible = false
	_charge_lvl()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !isFinished:
		isPlayerDead()
		$UI/Lvl/Lvl_Count.text = str(lvl)
		$UI/Vie/Vie_count.text = str($Player.nb_vie)
	
	_is_all_enemies_dead()
	$UI/enemies.text = str($Asteroids.score)
	if enemies_counter == 0:
		counter = counter + delta
		$Player.position.x = 786.562
		$Player.position.y = 416.507
		$Player.velocite = Vector2(0,0)
		if counter > 1:
			lvl = lvl + 1
			_charge_lvl()
			counter = 0

func _charge_lvl():
	var x
	var y
	var nb = lvl * 5 + 5
	var angle = randi() % 360
	var isBig = false
	for i in range(nb):
		var pos = $Asteroids._get_pos()
		var randbig = randi() % 2
		if randbig > 0:
			isBig = true
		$Asteroids._add_asteroid(isBig,pos,angle)

func _is_all_enemies_dead():
	enemies_counter = $Asteroids.asteroids.size()

func isPlayerDead():
	if !isFinished:
		if $Player.dead:
			$UI/Dead.visible = true
			isFinished = true
			$Player.queue_free()
	

func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")
