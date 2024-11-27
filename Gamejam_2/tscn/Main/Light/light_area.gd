extends Area2D
var body
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#
#func _on_body_entered(body: Node2D) -> void:
#
#func _on_body_exited(body: Node2D) -> void:



func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("randarea"):
		body = area.get_parent()
		if body.is_in_group("RandPosItems"):
			body.is_in -= 1
			if body.is_in == 0:
				body.randnum()
				body.randpos()
			print("2,",body.is_in)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("randarea"):
		body = area.get_parent()
		if body.is_in_group("RandPosItems"):
			body.is_in += 1
		print("1,",body.is_in)
