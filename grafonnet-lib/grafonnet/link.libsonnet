{
  dashboards(
    title,
    tags,
    asDropdown=true,
    includeVars=false,
    keepTime=false,
    icon=null,
    url=null,
    targetBlank=false,
    type='dashboards',
  )::
    {
      #asDropdown: asDropdown,
      #icon: icon,
      includeVars: includeVars,
      keepTime: keepTime,
      tags: tags,
      title: title,
      type: type,
      #url: url,
      targetBlank: targetBlank,
      [if asDropdown != false then 'asDropdown']: asDropdown,
      [if icon != null then 'icon']: icon,
      [if url != null then 'url']: url,
    },
}
