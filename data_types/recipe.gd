class_name Recipe
extends Resource

@export var inputs: Array[InventorySlotData] = []
@export var outputs: Array[InventorySlotData] = []
## Time in seconds to craft recipe.
@export var crafting_time: int

func find_input_item(item: InventoryItem) -> int:
	var index = 0
	for cur_input in inputs:
		if cur_input.item == item:
			return index
		index+=1
	return -1
