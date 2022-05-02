# reload.fish

reload function for fish-shell

## Prerequisites

This plugin suppose `fish` isn't your login shell and called from `bash`.  
If you'd like to launch `fish` automatically, please write the following sentences in `~/.bashrc`.

```sh
# ~/.bashrc

if [ -z "$FISH_VERSION" ]; then
    command -v fish > /dev/null 2>&1 && exec fish
fi
```

With this, `fish` will run when you open a new terminal, and you can launch `bash` from `fish`.

```sh
~
❯ bash
kenji@desktop:~$
```

## Installation

### Using fisher (recommended)

```sh
fisher install kenji-miyake/reload.fish
```

### Using local-install script (for development)

```sh
git clone git@github.com:kenji-miyake/reload.fish.git
cd reload.fish
./install
```

## Usage

Just call `reload` and your environment will be refreshed.

```sh
reload
```

Also, you can set some environment variables before reloading.

```sh
# `echo ROS_DISTRO=$ROS_DISTRO` is written in .bashrc
$ reload -e 'ROS_DISTRO=rolling'
ROS_DISTRO=rolling
```

If you'd like to evaluate a command before reloading, please use `-c` option.

```sh
# `echo ROS_DISTRO=$ROS_DISTRO` is written in .bashrc
$ cd YOUR_ROLLING_WORKSPACE
$ reload -c 'bass source install/setup.bash' -e 'ROS_DISTRO=$ROS_DISTRO'
ROS_DISTRO=rolling
```

## Example

```sh
~
❯ set value 1

~
❯ echo $value
1

~
❯ reload
~
❯ echo $value

```

## Tips

### For ROS users

With this tool, you can reload your shell in ROS1 or ROS2 mode, without modifying your .bashrc and re-launching a new terminal.

```bash
// .bashrc

echo "before: ROS_DISTRO=$ROS_DISTRO, ROS_VERSION=$ROS_VERSION"

# ROS
if [ "$ROS_DISTRO" = "rolling" ]; then
    source /opt/ros/rolling/setup.bash
elif [ "$ROS_DISTRO" = "foxy" ]; then
    source /opt/ros/foxy/setup.bash
elif [ "$ROS_DISTRO" = "noetic" ]; then
    source /opt/ros/noetic/setup.bash
else
    echo "Invalid ROS_DISTRO `$ROS_DISTRO` was given."
fi

echo "after: ROS_DISTRO=$ROS_DISTRO, ROS_VERSION=$ROS_VERSION"
```

```sh
$ reload -e 'ROS_DISTRO=rolling'
before: ROS_DISTRO=rolling, ROS_VERSION=
after: ROS_DISTRO=rolling, ROS_VERSION=2

$ reload -e 'ROS_DISTRO=foxy'
before: ROS_DISTRO=foxy, ROS_VERSION=
after: ROS_DISTRO=foxy, ROS_VERSION=2

$ reload -e 'ROS_DISTRO=noetic'
before: ROS_DISTRO=noetic, ROS_VERSION=
after: ROS_DISTRO=noetic, ROS_VERSION=1
```
