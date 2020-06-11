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
fisher add kenji-miyake/reload.fish
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
