local g = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local panels = import './panels.jsonnet';

local row = g.panel.row;

// local arow = row.new("Overview")
// + row.withCollapsed(true)
// + row.withPanels([apanel])
// ;


local node_dashboard = g.dashboard.new("Node details")
+ g.dashboard.withDescription("This dashboard provides details about node_exporter metrics")
+ g.dashboard.withUid("node-details")
+ g.dashboard.withPanels(panels.panels);

node_dashboard