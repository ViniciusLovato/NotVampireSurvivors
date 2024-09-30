extends Node

@export var upgrade_pool: Array[AbilityUpgrade]
@export var experience_manager: ExperienceManager

var current_upgrades = {}

func _ready():
	experience_manager.level_up.connect(on_level_up)
	
	
func on_level_up(current_level: int):
	var choosen_upgrade = upgrade_pool.pick_random() as AbilityUpgrade
	if choosen_upgrade == null:
		return
		
	var has_upgrade = current_upgrades.has(choosen_upgrade.id)
	if not has_upgrade:
		current_upgrades[choosen_upgrade.id] = {
			"resource": choosen_upgrade,
			"quantity": 1
		}
	else:
		current_upgrades[choosen_upgrade.id]["quantity"] += 1
