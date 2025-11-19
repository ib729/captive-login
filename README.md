# clogin - captive-portal login utility

### SYNOPSIS

`Usage: clogin login|logout|loop|test [--help] [OPTION...]`

Login:

`clogin login -u test -p test`

Test connectivity:

`clogin test`

Continuesly check login state:

`clogin loop -u test -p test`

Logout:

`clogin logout`

### INSTALL

```bash
wget https://raw.githubusercontent.com/ib729/captive-login/master/bin/clogin
chmod +x clogin
sudo mv clogin /usr/local/bin
```
``` 

**Supported options:**

- `-f, --conf` - Path to config file (Defaults to `clogin.conf`)
- `-l, --log-file <val>` - Set log file (Defaults to `/dev/stderr`)
- `-u, --username <val>` - Set login username
- `--user-field <val>` - Set username field name (Defaults to `username`)
- `-p, --password <val>` - Set login password
- `--password-field <val>` - Set password field name (Defaults to `password`)
- `--allow-empty` - Allow using empty username and password
- `-c, --client <val>` - Set http client to make requests. (Possible values: `auto|curl|wget`)
- `--base <val>` - Set http client base url (Defauts to `https://login.aut.ac.ir`)
- `--login-endpoint <val>` - Set login endpoint (Defaults to `/login`)
- `--logout-endpoint <val>` - Set logout endpoint (Defaults to `/logout`)
- `--test-url <val>` - Set connectivity test url (Default to `http://icanhazip.com`)
- `--loop-interval <val>` - Set loop interval in seconds (Defaults to `1800` = `30 minutes`)
- `-h, --help` - Display help message
- `-v, --version` - Display version
-  `-x, --debug` - Debug mode. Shows all internal invoked commands

### CONFIG FILE

Config files at the paths of `/usr/local/etc/clogin.conf`, `/etc/clogin.conf` and `~/.clogin.conf` will be applied if readable in order **before** parsing options. For a complete example see [etc/clogin.conf](etc/clogin.conf).

```bash
USERNAME=foo
PASSWORD=bar
```

When `CONFIG_FILE` environment variable or `-f, --conf` options provided it will be applied **after** parsing options.

### ENVIRONMENT VARIABLES

It is possible to use environment variables instead of arguments to configure clogin.

Supported environment variables:

- `CONFIG_FILE`
- `LOG_FILE`
- `USERNAME`
- `USERNAME_FIELD`
- `PASSWORD`
- `PASSWORD_FIELD`
- `ALLOW_EMPTY`
- `HTTP_CLIENT`
- `BASE_URL`
- `LOGIN_ENDPOINT`
- `LOGOUT_ENDPOINT`
- `SUCCESS_CODE`
- `TEST_URL`
- `TEST_SUCCESS_CODE`
- `LOOP_INTERVAL`

## DOCKER

You can build the docker image locally:

```bash
docker build -t clogin .
```

Then run it:

```bash
docker run -it --rm  -e USERNAME="test" -e PASSWORD="test" clogin loop
```

## DEVELOPMENT

This project uses [BATS](https://github.com/bats-core/bats-core) for automated testing, [Dockerfile](https://docs.docker.com/engine/reference/builder) for packaging and [Makefile](https://www.gnu.org/s/make/manual/make.html) for development workflow.

Available Makefile commands:

- `make test` - Run BATS tests
- `make install` - Installs `clogin` utility to `/usr/local/bin`
- `make docker-build` - Build docker image
- `make docker` - Build and test docker image functionality

Feel free forking this repository and making PRs for features and fixes :)

## RELATED PROJECTS

- [Reyhoon Hotspot Login](https://github.com/mamal72/reyhoon-hotspot-login) - A simple http client written in go to log us in with less pain and effort.
- [Mili](https://github.com/SadeghHayeri/Mili) - Mili is an open source tool for auto login hotspot pages! (MacOS + Linux)

## LICENSE

Copyright (C) 2018 Pooya Parsa <pooya@pi0.ir>
Copyright (C) 2025 Ivan Belousov <hello@ivanbelousov.com>

This project is licensed under the GPL-3.0 License. See the [LICENSE](LICENSE) file for details.
