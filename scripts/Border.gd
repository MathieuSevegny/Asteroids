extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#



func _on_Border_body_exited(body):
	var bodyx = body.position.x
	var bodyy = body.position.y
	
	if bodyx <= 40:
		body.position.x = 1500
	if bodyx >= 1530:
		body.position.x = 50
	if bodyy <= 40:
		body.position.y = 900
	if bodyy >= 900:
		body.position.y = 50
	if "Balle" in body.name:
		body.queue_free()
