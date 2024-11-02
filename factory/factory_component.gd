class_name FactoryComponent
extends Node

@export var inventory_component: InventoryComponent2D
@export var recipe: Recipe
## Only for testing.
@export var test_insert_item: InventorySlotData

func _ready():
	if recipe != null:
		set_recipe(recipe)

## Only for testing.
func _unhandled_input(event):
	if event.is_action_pressed("ui_right"):
		print("inserted?: ", insert_item(test_insert_item))

func set_recipe(new_recipe: Recipe):
	recipe = new_recipe
	var new_inventory: Inventory = generate_inventory()
	inventory_component.change_inventory(new_inventory)

## @experimental: This method is incomplete.
func insert_item(input_data: InventorySlotData) -> bool:
	var input_index = recipe.find_input_item(input_data.item)
	if input_index == -1:
		return false
	var returned_items = inventory_component.inventory.add_item(input_data)
	return returned_items == null

func generate_inventory() -> Inventory:
	var inv_items: Array[InventorySlotData]
	for input_item: InventorySlotData in recipe.inputs:
		var temp_slot_data = InventorySlotData.new()
		temp_slot_data.item = input_item.item
		temp_slot_data.amount = 0
		inv_items.append(temp_slot_data)
	var new_inventory: Inventory = Inventory.new()
	new_inventory.items = inv_items
	return new_inventory
