extends Area2D

#amount of energy cells is changed and affected here
func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.add_energy_cell()
		queue_free()
