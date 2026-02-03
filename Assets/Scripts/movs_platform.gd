extends Path2D
class_name movingPlatforms

@export var path_follow: PathFollow2D

func _ready():
	move_tween()

func move_tween():
	var tween = get_tree().create_tween().set_loops()
	tween.tween_property(path_follow, "progress_ratio", 1.0, 2)
	tween.tween_property(path_follow, "progress_ratio", 0.0, 2)
