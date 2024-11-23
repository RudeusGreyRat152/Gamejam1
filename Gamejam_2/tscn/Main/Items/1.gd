extends StaticBody2D
@onready var light_area: Area2D = %LightArea

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_light_area_body_exited(body: Node2D) -> void:
	self.position.x += (rng.randf()-0.5) * 30
