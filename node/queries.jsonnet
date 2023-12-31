local g = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';


local ds = {
    type: "prometheus",
    uid: "grafanacloud-prom"
};

local cpuQ = "1 - node_memory_MemAvailable_bytes{instance=\"rpi-4-01\"}/node_memory_MemTotal_bytes{instance=\"rpi-4-01\"}";

{
    ds : ds,
    cpu: g.query.prometheus.new(ds, cpuQ) + g.query.prometheus.withDatasource(ds),
}