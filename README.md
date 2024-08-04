# QBCore Wheelchair Script

This script allows players to spawn a wheelchair vehicle by using an item called `wheelchair` in QBCore framework.

## Features

- Spawn a wheelchair vehicle (`iak_wheelchair`) using the `wheelchair` item.

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

- Script by [Zartoz](https://github.com/YourName)
