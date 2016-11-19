# Item Interfaces
A mod that allows modders to create custom interfaces that are opened by activating an active item.

By using the fossil brush script, the items and interfaces are vanilla-multiplayer compatible.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Wiki](#wiki)
- [Planned](#planned)
- [Potential Issues](#potential-issues)

## Features

* Method of opening `ScriptPane` and `ScriptConsole` interfaces when activating custom items that are vanilla multiplayer-compatible.
* Reading the ItemDescriptor used to open the interface, from inside the interface script.
* Templates for both a `ScriptPane` and `ScriptConsole` item interface to get you started.

## Installation
* [Download](https://github.com/Silverfeelin/Starbound-ItemInterfaces/releases) the latest release.
* Place the `ItemInterfaces.pak` in your mod folder (`/Starbound/mods/ItemInterfaces.pak`).

## Wiki
Setting up, redistribution and other information can be found on the [Wiki](https://github.com/Silverfeelin/Starbound-ItemInterfaces/wiki) of this repository.

## Planned
No additional features planned yet. Feel free to create a feature request by creating [a new Issue](https://github.com/Silverfeelin/Starbound-ItemInterfaces/issues/new).

## Potential Issues

* This mod is incompatible with other mods that affect the `fossilbrush.lua` script. This script is used to keep the mod from causing issues on servers.
* Although the script catches item interfaces that the client does not have (that is, the configuration file), it can cause a couple of seconds of lag the first time the item is held.

