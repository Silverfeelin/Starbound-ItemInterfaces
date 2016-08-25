# Item Interfaces
A modders template for custom interfaces opened by activating active items. By using the fossil brush script, the items and interfaces are vanilla-multiplayer compatible.  
Feel free to fork this for your own interfaces, or simply download the source code and work from there!

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Setting up your interface](#setting-up-your-interface)
- [Setting up your item](#setting-up-your-item)
- [Getting your item](#getting-your-item)
- [Planned](#planned)
- [Potential Issues](#potential-issues)
- [Licenses](#licenses)

## Features
* Method of opening interfaces when activating custom items that are vanilla multiplayer-compatible.
* Template for an item interface to get you started.

## Installation
* [Download](https://github.com/Silverfeelin/Starbound-ItemInterfaces/archive/master.zip) the source code of this repository.
* Place the source code in a mod folder (eg. `/mods/MyItemInterface/`).

## Setting up your interface
* Create a copy of `/interface/itemInterface/itemInterface.json` and `/interface/itemInterface/itemInterface.lua`, and give them a new name.
* In the `json` file, update the script path so it points to your renamed script.
* Set up your gui in the `gui` table. This works like setting up any other interface.
 * If the interface is not big enough for you, you can also change the `fileHeader`, `fileBody` adn `fileFooter`.
 * Custom images should work fine, even on servers.

## Setting up your item
* Open the `item.txt` file. This file holds a `/spawnitem` command that can be pasted in-game to obtain the item that opens the custom interface.
 * If you want to set up multiple interfaces, it's recommended to create a copy of the file.
* Change the `itemInterface` path to the path of the interface `json` file you made in [Setting up your interface](#setting-up-your-interface).
 * The key and value can be found near the beginning of the command, right after `shortdescription`, `description` and `category`.
* Optionally, set other parameters such as the `shortdescription`, `description` and `category`.
* Save the file.

## Getting your item
* Open the `item.txt` file.
* Select and copy all text (`ctrl+a ctrl+c`).
 * If your text editor added a blank line at the end of the file, you'll need to manually remove this line before copying the command. Line breaks prevent you from pasting the command in-game.
* Run the command in-game by pasting it in your chat. This will spawn the item at your cursor.

## Planned
No additional features planned yet. Feel free to create a feature request by adding the `enhancement` tag to [a new Issue](https://github.com/Silverfeelin/Starbound-ItemInterfaces/issues/new).

## Potential Issues
* This mod is incompatible with other mods that affect the `fossilbrush.lua` script. This script is used to keep the mod from causing issues on servers.

## Licenses
The icon used for the sample item is courtesy of Yusuke Kamiyamane, and can be found in his Fugue Icons pack. The icon pack falls under the Creative Commons 3.0 license.

Yusuke Kamiyamane: http://p.yusukekamiyamane.com/about/
Fugue Icons pack: http://p.yusukekamiyamane.com/
Creative Commons 3.0: https://creativecommons.org/licenses/by/3.0/
