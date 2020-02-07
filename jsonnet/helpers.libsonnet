local html = import 'html.libsonnet';

local instagram_handle(handle) =
  if handle != null then
    html.a('📷', 'https://www.instagram.com/%s/' % handle)
  else
    ''
;

local instagram_location(loc) =
  if loc != null then
    html.a('📍', 'https://www.instagram.com/explore/locations/%s/' % loc)
  else
    ''
;

local instagram_hashtag(tag) =
  if tag != null then
    html.a('#️⃣', 'https://www.instagram.com/explore/tags/%s/' % tag)
  else
    ''
;

{
  /*
  hours1(start, end)::
    '%s–%s' % [
      start,
      end,
    ]
  ,
  */

  date_added(date)::
    if date != null then
      'data-date-added="%s"' % [date]
    else
      ''
  ,

  date_opened(date, source)::
    if date != null && source != null then
      'data-date-opened="%s" data-date-opened-source="%s"' % [date, source]
    else if date != null then
      'data-date-opened="%s"' % [date]
    else if source != null then
      'data-date-opened-source="%s"' % [source]
    else
      ''
  ,

  date_closed(is_closed, date, source)::
    if is_closed then
      if date != null && source != null then
        'data-closed="true" data-date-closed="%s" data-date-closed-source="%s"' % [date, source]
      else if date != null then
        'data-closed="true" data-date-closed="%s"' % [date]
      else if source != null then
        'data-closed="true" data-date-closed-source="%s"' % [source]
      else
        'data-closed="true"'
    else
      ''
  ,

  hours(start, end, closed)::
    if closed then
      ''
    else
      '%s–%s' % [
        start,
        end,
      ]
  ,


  /*
  ig1(handle=null, loc=null, tag=null):: {
    handle: igh(handle),
    loc: igl(loc),
    tag: igt(tag),
  },
  */

  instagram(handle=null, loc=null, tag=null, closed)::
    if closed then ''
    else
      '%(handle)s %(location)s %(hashtag)s' % {
        handle: instagram_handle(handle),
        location: instagram_location(loc),
        hashtag: instagram_hashtag(tag),
      }
  ,
 
  menu(menu, closed)::
    if closed then
      ''
    else if menu != null then
      html.a('menu', menu)
    else
      ''
  ,

  name(name, neighborhood=null, soon=false, new=false, hot=false, closed=false)::
    # todo: soon is weird b/c it should be calculated dynamically day-by-day
    if closed then
      '<s>%s</s>' % [name]
    else
      '%(name)s%(neighborhood)s%(soon)s%(new)s%(hot)s' % {
        name: name,
        neighborhood:
          if neighborhood != null then
            ' (%s)' % [neighborhood]
          else
            ''
        ,
        hot:
          if hot then
            ' 🔥'
          else
            ''
        ,
        new:
          if new then
            ' 🆕'
          else
            ''
        ,
        soon:
          if soon then
            ' 🔜'
          else
            ''
        ,
      }
  ,

  notes(notes, closed)::
    if closed then
      ''
    else if notes != null then
      notes
    else
      ''
  ,

  toast(has_toast, closed)::
    if closed then ''
    else
      if has_toast == null then
        ''  # unknown
      else if has_toast == false then
        ''  # known: no
      else '🍞'
        # known: yes
  ,
}
