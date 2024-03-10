oclif-hello-world
=================

oclif example Hello World CLI

[![oclif](https://img.shields.io/badge/cli-oclif-brightgreen.svg)](https://oclif.io)
[![CircleCI](https://circleci.com/gh/oclif/hello-world/tree/main.svg?style=shield)](https://circleci.com/gh/oclif/hello-world/tree/main)
[![GitHub license](https://img.shields.io/github/license/oclif/hello-world)](https://github.com/oclif/hello-world/blob/main/LICENSE)

<!-- toc -->
* [Usage](#usage)
* [Commands](#commands)
<!-- tocstop -->
# Usage
<!-- usage -->
```sh-session
$ npm install -g caravan-cli
$ caravan COMMAND
running command...
$ caravan (--version)
caravan-cli/0.0.0 darwin-arm64 node-v21.6.2
$ caravan --help [COMMAND]
USAGE
  $ caravan COMMAND
...
```
<!-- usagestop -->
# Commands
<!-- commands -->
* [`caravan hello PERSON`](#caravan-hello-person)
* [`caravan hello world`](#caravan-hello-world)
* [`caravan help [COMMAND]`](#caravan-help-command)
* [`caravan plugins`](#caravan-plugins)
* [`caravan plugins:install PLUGIN...`](#caravan-pluginsinstall-plugin)
* [`caravan plugins:inspect PLUGIN...`](#caravan-pluginsinspect-plugin)
* [`caravan plugins:install PLUGIN...`](#caravan-pluginsinstall-plugin-1)
* [`caravan plugins:link PLUGIN`](#caravan-pluginslink-plugin)
* [`caravan plugins:uninstall PLUGIN...`](#caravan-pluginsuninstall-plugin)
* [`caravan plugins reset`](#caravan-plugins-reset)
* [`caravan plugins:uninstall PLUGIN...`](#caravan-pluginsuninstall-plugin-1)
* [`caravan plugins:uninstall PLUGIN...`](#caravan-pluginsuninstall-plugin-2)
* [`caravan plugins update`](#caravan-plugins-update)

## `caravan hello PERSON`

Say hello

```
USAGE
  $ caravan hello PERSON -f <value>

ARGUMENTS
  PERSON  Person to say hello to

FLAGS
  -f, --from=<value>  (required) Who is saying hello

DESCRIPTION
  Say hello

EXAMPLES
  $ oex hello friend --from oclif
  hello friend from oclif! (./src/commands/hello/index.ts)
```

_See code: [src/commands/hello/index.ts](https://github.com/tincanbox/caravan-cli/blob/v0.0.0/src/commands/hello/index.ts)_

## `caravan hello world`

Say hello world

```
USAGE
  $ caravan hello world

DESCRIPTION
  Say hello world

EXAMPLES
  $ caravan hello world
  hello world! (./src/commands/hello/world.ts)
```

_See code: [src/commands/hello/world.ts](https://github.com/tincanbox/caravan-cli/blob/v0.0.0/src/commands/hello/world.ts)_

## `caravan help [COMMAND]`

Display help for caravan.

```
USAGE
  $ caravan help [COMMAND] [-n]

ARGUMENTS
  COMMAND  Command to show help for.

FLAGS
  -n, --nested-commands  Include all nested commands in the output.

DESCRIPTION
  Display help for caravan.
```

_See code: [@oclif/plugin-help](https://github.com/oclif/plugin-help/blob/v6.0.17/src/commands/help.ts)_

## `caravan plugins`

List installed plugins.

```
USAGE
  $ caravan plugins [--json] [--core]

FLAGS
  --core  Show core plugins.

GLOBAL FLAGS
  --json  Format output as json.

DESCRIPTION
  List installed plugins.

EXAMPLES
  $ caravan plugins
```

_See code: [@oclif/plugin-plugins](https://github.com/oclif/plugin-plugins/blob/v4.3.2/src/commands/plugins/index.ts)_

## `caravan plugins:install PLUGIN...`

Installs a plugin into the CLI.

```
USAGE
  $ caravan plugins add plugins:install PLUGIN...

ARGUMENTS
  PLUGIN  Plugin to install.

FLAGS
  -f, --force    Run yarn install with force flag.
  -h, --help     Show CLI help.
  -s, --silent   Silences yarn output.
  -v, --verbose  Show verbose yarn output.

GLOBAL FLAGS
  --json  Format output as json.

DESCRIPTION
  Installs a plugin into the CLI.
  Can be installed from npm or a git url.

  Installation of a user-installed plugin will override a core plugin.

  e.g. If you have a core plugin that has a 'hello' command, installing a user-installed plugin with a 'hello' command
  will override the core plugin implementation. This is useful if a user needs to update core plugin functionality in
  the CLI without the need to patch and update the whole CLI.


ALIASES
  $ caravan plugins add

EXAMPLES
  $ caravan plugins add myplugin 

  $ caravan plugins add https://github.com/someuser/someplugin

  $ caravan plugins add someuser/someplugin
```

## `caravan plugins:inspect PLUGIN...`

Displays installation properties of a plugin.

```
USAGE
  $ caravan plugins inspect PLUGIN...

ARGUMENTS
  PLUGIN  [default: .] Plugin to inspect.

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

GLOBAL FLAGS
  --json  Format output as json.

DESCRIPTION
  Displays installation properties of a plugin.

EXAMPLES
  $ caravan plugins inspect myplugin
```

_See code: [@oclif/plugin-plugins](https://github.com/oclif/plugin-plugins/blob/v4.3.2/src/commands/plugins/inspect.ts)_

## `caravan plugins:install PLUGIN...`

Installs a plugin into the CLI.

```
USAGE
  $ caravan plugins install PLUGIN...

ARGUMENTS
  PLUGIN  Plugin to install.

FLAGS
  -f, --force    Run yarn install with force flag.
  -h, --help     Show CLI help.
  -s, --silent   Silences yarn output.
  -v, --verbose  Show verbose yarn output.

GLOBAL FLAGS
  --json  Format output as json.

DESCRIPTION
  Installs a plugin into the CLI.
  Can be installed from npm or a git url.

  Installation of a user-installed plugin will override a core plugin.

  e.g. If you have a core plugin that has a 'hello' command, installing a user-installed plugin with a 'hello' command
  will override the core plugin implementation. This is useful if a user needs to update core plugin functionality in
  the CLI without the need to patch and update the whole CLI.


ALIASES
  $ caravan plugins add

EXAMPLES
  $ caravan plugins install myplugin 

  $ caravan plugins install https://github.com/someuser/someplugin

  $ caravan plugins install someuser/someplugin
```

_See code: [@oclif/plugin-plugins](https://github.com/oclif/plugin-plugins/blob/v4.3.2/src/commands/plugins/install.ts)_

## `caravan plugins:link PLUGIN`

Links a plugin into the CLI for development.

```
USAGE
  $ caravan plugins link PLUGIN

ARGUMENTS
  PATH  [default: .] path to plugin

FLAGS
  -h, --help          Show CLI help.
  -v, --verbose
      --[no-]install  Install dependencies after linking the plugin.

DESCRIPTION
  Links a plugin into the CLI for development.
  Installation of a linked plugin will override a user-installed or core plugin.

  e.g. If you have a user-installed or core plugin that has a 'hello' command, installing a linked plugin with a 'hello'
  command will override the user-installed or core plugin implementation. This is useful for development work.


EXAMPLES
  $ caravan plugins link myplugin
```

_See code: [@oclif/plugin-plugins](https://github.com/oclif/plugin-plugins/blob/v4.3.2/src/commands/plugins/link.ts)_

## `caravan plugins:uninstall PLUGIN...`

Removes a plugin from the CLI.

```
USAGE
  $ caravan plugins remove plugins:uninstall PLUGIN...

ARGUMENTS
  PLUGIN  plugin to uninstall

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Removes a plugin from the CLI.

ALIASES
  $ caravan plugins unlink
  $ caravan plugins remove

EXAMPLES
  $ caravan plugins remove myplugin
```

## `caravan plugins reset`

Remove all user-installed and linked plugins.

```
USAGE
  $ caravan plugins reset [--hard] [--reinstall]

FLAGS
  --hard       Delete node_modules and package manager related files in addition to uninstalling plugins.
  --reinstall  Reinstall all plugins after uninstalling.
```

_See code: [@oclif/plugin-plugins](https://github.com/oclif/plugin-plugins/blob/v4.3.2/src/commands/plugins/reset.ts)_

## `caravan plugins:uninstall PLUGIN...`

Removes a plugin from the CLI.

```
USAGE
  $ caravan plugins uninstall PLUGIN...

ARGUMENTS
  PLUGIN  plugin to uninstall

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Removes a plugin from the CLI.

ALIASES
  $ caravan plugins unlink
  $ caravan plugins remove

EXAMPLES
  $ caravan plugins uninstall myplugin
```

_See code: [@oclif/plugin-plugins](https://github.com/oclif/plugin-plugins/blob/v4.3.2/src/commands/plugins/uninstall.ts)_

## `caravan plugins:uninstall PLUGIN...`

Removes a plugin from the CLI.

```
USAGE
  $ caravan plugins unlink plugins:uninstall PLUGIN...

ARGUMENTS
  PLUGIN  plugin to uninstall

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Removes a plugin from the CLI.

ALIASES
  $ caravan plugins unlink
  $ caravan plugins remove

EXAMPLES
  $ caravan plugins unlink myplugin
```

## `caravan plugins update`

Update installed plugins.

```
USAGE
  $ caravan plugins update [-h] [-v]

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Update installed plugins.
```

_See code: [@oclif/plugin-plugins](https://github.com/oclif/plugin-plugins/blob/v4.3.2/src/commands/plugins/update.ts)_
<!-- commandsstop -->
