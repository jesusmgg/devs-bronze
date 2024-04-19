Automatically setups workspaces.

Requires my specific hardware and software setup so may not be that useful to anybody else.

## Installation
```bash
$ make install
```
The scripts are installed to `~/bin`.
The `~/bin/devs_startup.sh` con be added to `.profile` or `.bashrc` for startup workspace setup.

## Usage
```bash
$ ./devs.sh 4 project_name # Setups up workspace 4 with project `project_name`
$ ./devs.sh 4              # Setups up workspace 4 and opens a prompt to select project
```

## Requirements
Rought list of requirements:
- 3 monitors
- i3 window manager
- fzf
- Helix editor
- Firefox
- bash

Then they also should be configured like in my setup.
