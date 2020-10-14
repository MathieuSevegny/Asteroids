extends Node2D
var counter = 0


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	counter = 0
	$AnimatedSprite.frame = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter = counter + delta
	if counter > 1:
		queue_free()
