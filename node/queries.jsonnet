local g = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

local env = import 'environment.jsonnet';

local node_ds = {
    type: "prometheus",
    uid: env.node_datasource_uid
};

local cpuQ = "1 - node_memory_MemAvailable_bytes{instance=\"rpi-4-01\"}/node_memory_MemTotal_bytes{instance=\"rpi-4-01\"}";

{
    node_ds : node_ds,
    cpu: g.query.prometheus.new(node_ds, cpuQ) + g.query.prometheus.withDatasource(node_ds),
}