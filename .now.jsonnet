local now = import '.now.libsonnet';

{
  'now.dev.json': now.config(
    name='qcbrunch-dev',
    alias=[
      'dev.qcbrunch.com',
    ],
  ),
  'now.prod.json': now.config(
    name='qcbrunch',
    alias=[
      'qcbrunch.com',
      'www.qcbrunch.com',
    ],
  ),
}
