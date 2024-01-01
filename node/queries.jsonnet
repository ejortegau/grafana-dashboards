local g = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

local env = import 'environment.jsonnet';

local node_ds = {
    type: "prometheus",
    uid: env.node_datasource_uid
};

local cpuQ = "1 - node_memory_MemAvailable_bytes{instance=\"rpi-4-01\"}/node_memory_MemTotal_bytes{}";

local query(ds, queryStr, legend) = g.query.prometheus.new(ds, cpuQ) 
    + g.query.prometheus.withDatasource(ds)
    + g.query.prometheus.withLegendFormat(legend)
;

{
    node_ds : node_ds,
    cpu: query(node_ds, cpuQ, "{{instance}}"),
}