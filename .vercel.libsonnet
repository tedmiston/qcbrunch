{
  config(name, alias)::
    {
      version: 2,
      name: name,
      alias: alias,
      builds: [
        { src: '{*.html,*/*.html,css/*.css,images/*,js/*.js}', use: '@vercel/static' },
      ],
      routes: [
        { src: '/stats', dest: '/stats.html' },
      ],
      public: false,
      github: {
        enabled: false,
      },
    },
}
