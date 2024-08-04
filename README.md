# Advanced QBCore Wheelchair Script

This script lets players spawn a wheelchair vehicle using an item called wheelchair within the QBCore framework. Both the wheelchair item and vehicle spawn code can be customized in the config.lua. Players can also remove the wheelchair and return it to their inventory. Adjust the target system by modifying the config.lua file.

## Features

- Spawn a wheelchair vehicle (`iak_wheelchair`) using the `wheelchair` item.
- Remove the wheelchair using `qb-target` or `ox_target` (configurable in `config.lua`).

## Installation

1. **Download and Extract**
   - Download the script, remove the main from the end and extract it to your `resources` folder.

2. **Add to Server Config**
   - Add the resource to your `server.cfg`:
     ```plaintext
     ensure qb-wheelchair
     ```

3. **Configure Item**
   - Add the `wheelchair` item to your `qb-core/shared/items.lua` file:
     ```lua
     ['wheelchair'] = {['name'] = 'wheelchair', ['label'] = 'Wheelchair', ['weight'] = 5000, ['type'] = 'item', ['image'] = 'wheelchair.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A portable wheelchair to help you move around.'},
     ```

4. **Add Item Image**
   - Place the `wheelchair.png` image in the `qb-inventory/html/images` directory.

## Usage

- Players can use the `wheelchair` item from their inventory to spawn a wheelchair vehicle.

## Credits

- Script by [Zartoz](https://github.com/Zartoz)
