local g = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local gTextpanel = g.panel.text;
local gTimeSeries = g.panel.timeSeries;
local gRow = g.panel.row;

local queries = import './queries.jsonnet';


local p = gTextpanel.new("A text panel");
local gRow = g.panel.row;

local collapsedPannel(title) = gRow.new(title)
+ gRow.withCollapsed(true);

local standardLegend = {
    calcs: ['first', 'min', 'mean', 'max',  'last'],
    displayMode: "table",
    placement: "bottom",
    showLegend: true,
};

local timeSeries(title, targets) = gTimeSeries.new(title)
    + gTimeSeries.queryOptions.withDatasourceMixin(queries.node_ds) 
    + gTimeSeries.queryOptions.withTargets(targets);
local timeSeriesWithLegend(title, legend, targets) = timeSeries(title, targets) + gTimeSeries.options.withLegend(legend); 
local timeSeriesWithStandardLegend(title, targets) = timeSeriesWithLegend(title, standardLegend, targets);
local timeSeriesPercentageUnitWithStandardLegend(title, targets) = timeSeriesWithStandardLegend(title, targets)
    + gTimeSeries.standardOptions.withUnit("percentunit");


{
    // rows: {
    //     cpu: collapsedPannel("cpu") + gRow.withPanels(timeSeriesWithStandardLegend("CPU"))
    // },
    panels: [
        timeSeriesPercentageUnitWithStandardLegend("CPU utilization", queries.cpu)
        + gTimeSeries.panelOptions.withGridPos(8, 12, 0, 0)
    ],
}