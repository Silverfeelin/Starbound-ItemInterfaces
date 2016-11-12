# Item Interfaces
A mod that allows modders to create custom interfaces that are opened by activating an active item.

By using the fossil brush script, the items and interfaces are vanilla-multiplayer compatible.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Setting up your interface](#setting-up-your-interface)
- [Setting up your item](#setting-up-your-item)
- [Getting your item](#getting-your-item)
- [Planned](#planned)
- [Potential Issues](#potential-issues)

## Features

* Method of opening `ScriptPane` and `ScriptConsole` interfaces when activating custom items that are vanilla multiplayer-compatible.
* Reading the ItemDescriptor used to open the interface, from inside the interface script.
* Templates for both a `ScriptPane` and `ScriptConsole` item interface to get you started.

## Installation
* [Download](https://github.com/Silverfeelin/Starbound-ItemInterfaces) the latest release.
* Place the `ItemInterfaces.pak` in your mod folder (`/Starbound/mods/ItemInterfaces.pak`).

#### Including the mod in your own release
You're free to include the `ItemInterfaces.pak` files from the [Release page](https://github.com/Silverfeelin/Starbound-ItemInterfaces/releases) in your own releases.

Please do keep in mind that this packed mod contains the `LICENSE` file, also found in this repository. If you're going to alter or redistribute assets (you probably shouldn't need to), refer to the license.

To keep it simple; repacking or just redistributing (parts of) the ItemInterfaces mod without this license is not allowed. Since the released mod pack contains the license, you don't need to add another copy of the license by hand.

## Setting up your interface

* Create a copy of one of the two sample interfaces found in `/interface/sampleItemInterfaces/`, and give them a new (identical) name.
 * EG. `itemInterfacePane.json` and `itemInterfacePane.lua` to `myPane.json` and `myPane.lua` respectively.
* In the `json` file, update the script path so it points to your renamed script.
* Set up your interface like you would set up any other interface. If you don't know how, refer to assets, other mods or other guides.

Custom images inside the interfaces work fine, even on servers.

## Setting up your item

* Copy the `/interface/sampleItemInterfaces/spawnConsole.txt` (or `spawnPane.txt`) file. This file holds a `/spawnitem` command that can be pasted in-game to obtain the item that opens the custom sample interface.
* In your copy, change the `itemInterface` path to the path of the interface `json` file you made in [Setting up your interface](#setting-up-your-interface).
* Change (or set) the `itemInterfaceType` parameter to `ScriptPane` or `ScriptConsole`, if necessary. If this parameter is not present, `ScriptConsole` will be used.
* Optionally, set other parameters such as the `shortdescription`, `description` and `category`.
* Save the file.

## Getting your item

* Open the spawnitem file you created in [Setting up your item](#setting-up-your-item).
* Select and copy all text (<kbd>ctrl+a</kbd> <kbd>ctrl+c</kbd>).
 * If your text editor added a blank line at the end of the file, you'll need to manually remove this line before copying the command. Line breaks prevent you from pasting the command in-game.
* Run the command in-game by pasting it in your chat (<kbd>ctrl+v</kbd> <kbd>enter</kbd>). This will spawn the item at your cursor.

## Planned
No additional features planned yet. Feel free to create a feature request by creating [a new Issue](https://github.com/Silverfeelin/Starbound-ItemInterfaces/issues/new).

## Potential Issues

* This mod is incompatible with other mods that affect the `fossilbrush.lua` script. This script is used to keep the mod from causing issues on servers.
* Although the script catches item interfaces that the client does not have (that is, the configuration file), it can cause a couple of seconds of lag the first time the item is held.

