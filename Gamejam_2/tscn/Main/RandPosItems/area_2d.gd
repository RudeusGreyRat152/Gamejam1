extends Area2D
var temp 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("randarea")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	await get_tree().create_timer(0.5).timeout
	temp = self.position


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("randarea") and self.position != temp:
		get_parent().position.y += 1000
		await get_tree().create_timer(0.01).timeout
		get_parent().randnum()
		await get_tree().create_timer(0.01).timeout
		get_parent().randpos()
