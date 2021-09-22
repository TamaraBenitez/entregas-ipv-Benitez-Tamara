extends Sprite

export (PackedScene) var proyectile_scene:PackedScene
var player 
onready var fire_position:Position2D= $FirePosition
var proyectile_container:Node


func set_values(player,proyectile_container):
	self.player=player
	self.proyectile_container =proyectile_container
	$Timer.start()

func _on_Timer_timeout():
	fire()
	
func fire():
	var proyectile:Proyectile = proyectile_scene.instance()
	proyectile_container.add_child(proyectile)
	proyectile.set_starting_values(fire_position.global_position,(player.global_position - fire_position.global_position).normalized())
	proyectile.connect("delete_requested",self,"_on_proyectile_delete_requested")

func _on_proyectile_delete_requested(proyectile):
	proyectile_container.remove_child(proyectile)
	proyectile.queue_free()	