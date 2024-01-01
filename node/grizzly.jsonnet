local details = import "./details.jsonnet";
local grr = import 'grizzly/grizzly.libsonnet';


grr.dashboard.new(details.uid, details)