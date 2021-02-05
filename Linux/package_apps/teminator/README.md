## Install

In Ubuntu, open terminal `(Ctrl + Alt + t)` and write the following commands:

Add Terminator Repository:

```sh
sudo add-apt-repository ppa:gnome-terminator
```

Update sources.list:

```sh
sudo apt-get update
```

Install Terminator:

```sh
sudo apt-get install terminator
```

That’s it you have successfully installed Terminator in Ubuntu.

## Uninstall Terminator

Open terminal `(Ctrl + Alt + t)` and write the following commands:

1.Uninstall just terminator:

```sh
sudo apt-get remove terminator
```

2.Uninstall terminator and its dependencies:

```sh
sudo apt-get remove --auto-remove terminator
```

This will remove the terminator package and any other dependant packages which are no longer needed.

3.Purging your config/data too
If you also want to delete your local/config files for terminator then this will work.

> Caution! Purged config/data can not be restored by reinstalling the package.

```sh
sudo apt-get purge terminator
```
