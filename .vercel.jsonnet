local vercel = import '.vercel.libsonnet';

{
  'vercel.dev.json': vercel.config(
    name='qcbrunch-dev',
    alias=['dev.qcbrunch.com'],
  ),
  'vercel.prod.json': vercel.config(
    name='qcbrunch-prod',
    alias=['qcbrunch.com', 'www.qcbrunch.com'],
  ),
}
