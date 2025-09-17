extends Area2D
class_name AreaExit


@export var sprite : Sprite2D


var is_open = false 

func _ready():
	close()

#open portal
func open():
	is_open = true 
	sprite.region_rect.position.x = 22
#closed portal
func close():
	is_open = false 
	sprite.region_rect.position.x = 0
#if player enters (open) Dportal sends to next level
func _on_body_entered(body: Node2D) -> void:
	if is_open && body is PlayerController:
		GameManager.next_level()
