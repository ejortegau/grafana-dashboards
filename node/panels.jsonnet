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

local timeSeries(title) = gTimeSeries.new(title) + gTimeSeries.queryOptions.withDatasourceMixin(queries.ds);
local timeSeriesWithLegend(title, legend) = timeSeries(title) + gTimeSeries.options.withLegend(legend); 
local timeSeriesWithStandardLegend(title) = timeSeriesWithLegend(title, standardLegend);
// local timeSeriesPercentage(ts) = ts + gT


{
    rows: {
        cpu: collapsedPannel("cpu") + gRow.withPanels(timeSeriesWithStandardLegend("CPU"))
    },
    panels: [
        timeSeriesWithStandardLegend("CPU") + gTimeSeries.queryOptions.withTargets(queries.cpu)
    ],
}