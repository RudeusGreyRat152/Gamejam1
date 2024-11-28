extends Area2D
var gamemanager
var body
var rannum
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gamemanager = get_node("/root/Main/Gamemanager")

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
				if rannum != null:
					rannum = body.random_number
					gamemanager.pos[rannum-1][1] = 0 
					print("111")
				body.randnum()
				await get_tree().create_timer(0.01).timeout
				body.randpos()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("randarea"):
		body = area.get_parent()
		if body.is_in_group("RandPosItems"):
			body.is_in += 1
