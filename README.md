# grafana-dashboards

## Getting started

Run the following command to install dependencies:

```shell
./bootstrap.sh
```

It's output will give you directions to install Grafana's [`Grizzly`](https://grafana.github.io/grizzly/), which he script does not currently do.

## Configuration

### Environments

The definition of Grafana resources in this repo supports havig a single resource definition that works
across multiple grafana installations/environments. This is achieved by abstracting away all environment
specific information into a single file, and having `jsonnet` pick it up based on the `JSONNET_PATH`
environment variable.

Environment configuration includes, at the very minimal, datasource UIDs. It should be put in a 
file under the `environments/<environment_name>/environment.jsonnet` subdirectory. For an example, see
`environments/sample/environment.jsonnet`. Additionally, the `JSONNET_PATH` environment variable should be set to use it - as well as the dependencies that were vendored in during the bootstrap:

```shell
export JSONNET_PATH=$PWD/environments/my_environment:$PWD/vendor
```

Notice that path corresponding to the enviroment should be *before*  any others, so that jsonnet picks
the right environment information. This is how path order precedence works in `jsonnet`.

### Grizlly

Grizzly needs to be configured so that it can create Grafana resources for you. See its [documentation](https://grafana.github.io/grizzly/authentication/) for information.

Alternatively, you need to set up approrpiate `GRAFANA_URL` and `GRAFANA_TOKEN` (if your Grafana instance is using authentication) before running Grizzly. 

You can verify that your Grizzly configuration is correct by running

```shell
grr get Dashboard.${uid_of_existent_dashboard}
```
If everything is correct, it should show you a YAML representation of the dashboard.

## Running

After this, `jsonnet` can simply be run as:

```shell
jsonnet node/details.jsonnet
```

and it will print to standard output the generated dashboard.