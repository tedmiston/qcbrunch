{
  config(name, alias)::
    {
      version: 2,
      name: name,
      alias: alias,
      builds: [
        { src: '{*.html,*/*.html,css/*.css,images/*,js/*.js}', use: '@now/static' },
      ],
      routes: [
        { src: '/stats', dest: '/stats.html' },
      ],
      regions: ['all'],
      public: false,
      github: {
        enabled: false,
      },
    },
}
