# CaliOpen Development Environment And Toolbelt

We use [fig](http://fig.sh) to run [CaliOpen](http://caliopen.org) for
develoment purpose.

> Up to now, only external services are running in docker containers.
> CaliOpen service still run in a virtualenv. This should be fixed shortly.

## Install

A web install script contribution is welcome to allow a one line installation.
This should be dont using `curl -L https://some.script | sh` or
`wget -qO- https://some.script | sh`

While this script is not available, manual installation is required:

``` sh
# Create CaliOpen workdir
mkdir caliopen && cd $_

# Clone development utilities
git clone https://github.com/CaliOpen/caliopen-dev.git bin

# Set up development environment
./bin/install
```

> Note that following dependencies are required:
>
> * python
> * python-dev
> * virtualenv
> * libffi-dev
> * docker
>
> If you use debian, just run
> `aptitude install python python-dev python-virtualenv libffi-dev`

## Start Service

Starting service is as easy as running `./bin/start`.

Access CaliOpen in your browser at [http://localhost:6543](http://localhost:6543)

## Contributing

To contribute, simply fork the repository you want to contibute to, update the
related git remote and create a pull request.

> For instance, tu contribute to caliopen.web:
>
> ``` sh
> cd web
> git remote add caliopen https://github.com/CaliOpen/caliopen.web.git
> git remote set-url origin git@github.com:themouette/caliopen.web.git
> ```

**Note** that you are encouraged to use `features/xxx` branch name style and try
to describe as explicitly as possible what you're trying to achieve.

## Launch Tests

> To be defined

## Load fixtures

Some fixtures data are available for a quickstart.

To load fixtures, run:

``` sh
./bin/load-fixtures
```

> **Note** that in the following, `[at)` should be replaced with `@`

This will create a new user `julien.muetton[at)gandi.net` with password `123456`.

Some mails from the CaliOpen Development mailing list are inserted too.

> Feel free to add more fixtures, but be aware that any information in
> contributed fixtures are public
