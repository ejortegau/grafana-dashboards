local g = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local row = g.panel.row;
local ts = g.panel.timeSeries;

local panels = import './panels.jsonnet';

// local apanel = ts.new("CPU")
// + ts.options.legend.withDisplayMode('table')
// + ts.options.legend.withCalcs(['first', 'min', 'mean', 'max', 'last'])
// + ts.standardOptions.withMin(0)
// + ts.queryOptions.withDatasource('prometheus', 'grafanacloud-prom')
// + ts.queryOptions.withTargets(
//     []
// )
// ;

// local arow = row.new("Overview")
// + row.withCollapsed(true)
// + row.withPanels([apanel])
// ;


g.dashboard.new("Node details")
+ g.dashboard.withDescription("This dashboard provides details about node_exporter metrics")
+ g.dashboard.withUid("node-details")
+ g.dashboard.withPanels(panels.panels)

