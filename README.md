# quickbar

Bind commands to number keys 1-0 and toggle sending commands to your additional characters

## Installation

Copy the /quickbar folder into /Windower/addons
```lua
lua l quickbar
```

## Commands

`//quickbar` or `//qb`


`//qb run`
Command used by player, bound to keys 1-0 by default. Configured in /data/settings.xml (until commands are added to configure this)

`//qb st`

Toggles or sets the target for all characters. If triggered when selecting a mob, it will save the ID and send `qb tt` to other characters.  If nothing is currently targeted, it will toggle whether or not to send the currently targetted ID to other characters.

`//qb mode [next|prev]` 

Cycles through named Command Sets. This will be configurable by job later.


## Additional Notes

Uses the Direct Input Keyboard (DIK) Code for key binds, referenced in https://docs.windower.net/commands/keymapping/

Always uses the % modifier so macros wont fire when typing in chat, referenced from https://docs.windower.net/commands/input/

```
Supported Modifiers
Modifier	Description
^	Ctrl
!	Alt
@	Win
#	Apps
~	Shift
```
```
Supported Chat Input States
State	Description
$	Keybind is valid while the game input line is active
%	Keybind is valid while the game input line is inactive
```