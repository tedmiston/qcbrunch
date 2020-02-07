local helpers = import 'helpers.libsonnet';

local Place(
  id=null,
  name=null,
  neighborhood=null,
  soon=false,
  new=false,
  hot=false,

  hours__saturday_start=null,
  hours__saturday_end=null,
  hours__sunday_start=null,
  hours__sunday_end=null,

  menu=null,
  toast=null,
  notes=null,

  ig_handle=null,
  ig_loc=null,
  ig_tag=null,

  meta__added_date=null,
  meta__opened_date=null,
  meta__opened_source=null,
  meta__closed=false,
  meta__closed_date=null,
  meta__closed_source=null,
  meta__archived_date=null,
) = {
  id: id,
  name: name,
  neighborhood: neighborhood,
  soon: soon,
  new: new,
  hot: hot,

  hours__saturday_start: hours__saturday_start,
  hours__saturday_end: hours__saturday_end,
  hours__sunday_start: hours__sunday_start,
  hours__sunday_end: hours__sunday_end,

  menu: menu,
  toast: toast,
  notes: notes,

  ig_handle: ig_handle,
  ig_loc: ig_loc,
  ig_tag: ig_tag,

  meta__added_date: meta__added_date,
  meta__opened_date: meta__opened_date,
  meta__opened_source: meta__opened_source,
  meta__closed: meta__closed,
  meta__closed_date: meta__closed_date,
  meta__closed_source: meta__closed_source,
  meta__archived_date: meta__archived_date,

  key_func: $.name,
};

local to_string(x) =
  |||
    <tr id="%(id)s" %(date_added)s %(date_opened)s %(date_closed)s>
      <td>%(name)s</td>
      <td>%(saturday)s</td>
      <td>%(sunday)s</td>
      <td>%(menu)s</td>
      <td>%(instagram)s</td>
      <td>%(toast)s</td>
      <td>%(notes)s</td>
    </tr>
  ||| % {
    id: x.id,
    name: helpers.name(name=x.name, neighborhood=x.neighborhood, soon=x.soon, new=x.new, hot=x.hot, closed=x.meta__closed),

    saturday: helpers.hours(start=x.hours__saturday_start, end=x.hours__saturday_end, closed=x.meta__closed),
    sunday: helpers.hours(start=x.hours__sunday_start, end=x.hours__sunday_end, closed=x.meta__closed),

    menu: helpers.menu(x.menu, closed=x.meta__closed),
    toast: helpers.toast(x.toast, closed=x.meta__closed),
    notes: helpers.notes(x.notes, closed=x.meta__closed),

    instagram: helpers.instagram(handle=x.ig_handle, loc=x.ig_loc, tag=x.ig_tag, closed=x.meta__closed),

    date_added: helpers.date_added(x.meta__added_date),
    date_opened: helpers.date_opened(date=x.meta__opened_date, source=x.meta__opened_source),
    date_closed: helpers.date_closed(is_closed=x.meta__closed, date=x.meta__closed_date, source=x.meta__closed_source),
  };

local places = [

  Place(
    id='adesso-coffee',
    name='Adesso Coffee',
    neighborhood=null,
    soon=true,
    new=false,
    hot=false,
    hours__saturday_start=null,
    hours__saturday_end=null,
    hours__sunday_start=null,
    hours__sunday_end=null,
    menu=null,
    toast=false,
    notes='Anticipated to open <a href="https://www.wcpo.com/news/insider/mercantile-librarys-popular-adesso-coffee-cart-expanding-to-a-brick-and-mortar-site-in-mason" target="_blank" rel="noopener">in 2019</a>.',
    ig_handle='adessocoffee',
    ig_loc=null,
    ig_tag=null,
    meta__added_date='2018-04-25',
    meta__opened_date='3000-01-01',
    meta__opened_source=null,
    meta__closed=false,
    meta__closed_date=null,
    meta__closed_source=null,
    meta__archived_date=null,
  ),

  # template
  /*
  Place(
    id=null,
    name=null,
    neighborhood=null,
    soon=null,
    new=null,
    hot=null,
    hours__saturday_start=null,
    hours__saturday_end=null,
    hours__sunday_start=null,
    hours__sunday_end=null,
    menu=null,
    toast=null,
    notes=null,
    ig_handle=null,
    ig_loc=null,
    ig_tag=null,
    meta__added_date=null,
    meta__opened_date=null,
    meta__opened_source=null,
    meta__closed=null,
    meta__closed_date=null,
    meta__closed_source=null,
    meta__archived_date=null,
  ),
  */

];

local places_sorted = std.sort(places, keyF=function(x) x.key_func);
local places_str = std.join('\n', [to_string(x) for x in places_sorted]);

places_str
