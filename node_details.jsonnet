local g = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local row = g.panel.row;
local ts = g.panel.timeSeries;

local apanel = ts.new("CPU")
+ ts.options.legend.withDisplayMode('table')
+ ts.options.legend.withCalcs(['first', 'min', 'mean', 'max', 'last'])
+ ts.standardOptions.withMin(0)
;

local arow = row.new("Overview")
+ row.withCollapsed(false)
+ row.withPanels([apanel])
;

g.dashboard.new("Node details")
+ g.dashboard.withDescription("This dashboard provides details about node_exporter metrics")
+ g.dashboard.withUid("node-details")
+ g.dashboard.withPanels(arow)
