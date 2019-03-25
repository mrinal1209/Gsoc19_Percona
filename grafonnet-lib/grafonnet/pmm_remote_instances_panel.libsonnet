{
  new(
    title,
    id=null,
    datasource=null,
  )::
    {
      title: title,
      type: 'pmm-remote-instances-panel',
      datasource: datasource,
      id: id,
      targets: [
      ],
      links: [],
      _nextTarget:: 0,
      addTarget(target):: self {
        local nextTarget = super._nextTarget,
        _nextTarget: nextTarget + 1,
        targets+: [target { refId: std.char(std.codepoint('A') + nextTarget) }],
      },
    },
}
