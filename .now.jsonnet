local now = import '.now.libsonnet';

local project = 'qcbrunch';
local domain = 'qcbrunch.com';

{
  'now.dev.json': now.config(name=project + '-dev', alias=['dev.' + domain]),
  'now.prod.json': now.config(name=project, alias=[domain, 'www.' + domain]),
}
