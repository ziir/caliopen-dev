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
to describe as eplicitly as possible what you're trying to achieve.

## Launch Tests

> To be defined

## Load fixtures

> To be defined

# Bootstrap

bootstrap.sh will clone all caliopen repositories needed
for development purpose on your machine.

Your can define variables with a different value than default
ones, editing caliopen.env file.

Default values are defined in common.sh file

## Push a local branch

Another script is for push a branch existing in many components
to origin repository.

Use ./push_branch.sh <branch_name> with correct caliopen.env
file edited.

# Clear all data

./clear_data.sh can be used to :
- delete all local elasticsearch data
- delete caliopen keyspace on local running cassandra

Useful to test data loading again and again ;)
