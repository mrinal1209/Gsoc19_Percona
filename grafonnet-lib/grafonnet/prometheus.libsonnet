{
  target(
    expr,
    format='time_series',
    intervalFactor=2,
    datasource=null,
    interval=null,
    instant=null,
    refId=null,
  ):: {
    [if datasource != null then 'datasource']: datasource,
    expr: expr,
    refId: refId,
    format: format,
    intervalFactor: intervalFactor,
    [if interval != null then 'interval']: interval,
    [if instant != null then 'instant']: instant,
  },
}
