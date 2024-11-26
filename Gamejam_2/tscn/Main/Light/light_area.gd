extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("RandPosItems"):
		body.is_in += 1
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("RandPosItems"):
		body.is_in -= 0
		if body.is_in == 0:
			body.randnum()
			
