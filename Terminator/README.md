# A way to make terminator toggle its visibility using the F12 key (like guake)

1. Create the folder tree `~/.config/terminator` (maybe it exists already). Please note that the . in front of config is purposely there, it is the way to hide a folder.

2. In the folder create a file named config (the full path would be ~/.config/terminator/config) and put the following as content:

```sh
[global_config]
[keybindings]
  hide_window = F12
[layouts]
  [[default]]
    [[[child1]]]
      parent = window0
      type = Terminal
    [[[window0]]]
      parent = ""
      type = Window
[plugins]
[profiles]
  [[default]]
```
