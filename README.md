# Caliopen developer environment

All backend services are expected to run locally, it could
be in a docker container (or cgroups) but have to bind on
expected port

# Bootstrap

bootstrap.sh will clone all caliopen repositories needed
for development purpose on your machine.

Your can define variables with a different value than default
ones, editing caliopen.env file.

Default values are defined in common.sh file

# Push a local branch

Another script is for push a branch existing in many components
to origin repository.

Use ./push_branch.sh <branch_name> with correct caliopen.env
file edited.

# Clear all data

./clear_data.sh can be used to :
- delete all local elasticsearch data
- delete caliopen keyspace on local running cassandra

Useful to test data loading again and again ;)
