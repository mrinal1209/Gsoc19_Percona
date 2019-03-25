local grafana = import 'grafonnet/grafana.libsonnet';
local dashboard = grafana.dashboard;
local graphPanel = grafana.graphPanel;
local annotation = grafana.annotation;
local singlestat = grafana.singlestat;
local prometheus = grafana.prometheus;

dashboard.new(
  'reco-test-dashboard',
  time_from='now-6h',
  editable=true,
  schemaVersion=18,
  style='dark',
  uid='5cKE203mk',
  id=2,
  version=1,
)
.addAnnotation(
  grafana.annotation.datasource(
    'Annotations & Alerts',
    '-- Grafana --',
    enable=true,
    hide=true,
    type='dashboard',
    builtIn=1,
    iconColor='rgba(0, 211, 255, 1)',
  )
)
.addPanel(
    graphPanel.new(
      'Autoplay (95%)',
      format='short',
      fill=1,
      decimals=2,
      datasource='InfluxDB',
      legend_values=false,
      legend_min=false,
      legend_max=false,
      legend_current=false,
      legend_total=false,
      legend_avg=false,
      nullPointMode='null as zero',
      interval='30s',
      linewidth=2,
      paceLength=10,
    )
    .addTarget(
    	influxdb.target(
    	"SELECT mean(\"p95\") FROM \"AUTOPLAY_FEED_TIMER\" WHERE (\"api\" = 'RECO') AND $timeFilter GROUP BY time($__interval), \"node\" fill(null)",
    	rawQuery=true,
    	orderByTime='ASC',
    	),

    ), gridPos={
    x: 0,
    y: 0,
    w: 12,
    h: 9,
  }
)

