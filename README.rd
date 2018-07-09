cd /Users/gstearmit/mysite
virtualenv -p python env
env/bin/pip install django
source env/bin/activate


---------------------
python manage.py runserver 8080


1.1. Install the Debug Toolbar is via pip:

    $ pip install -e git+https://github.com/jazzband/django-debug-toolbar.git#egg=django-debug-toolbar

    https://django-debug-toolbar.readthedocs.io/en/stable/installation.html
    https://www.bedjango.com/blog/how-install-django-debug-toolbar/

    For installation we recommend use the virtual env and execute this command:

    Bash
    pip install django-debug-toolbar
    The configuration of this component is simple, but because most of the configuration must be done in the core of the settings of the project, we recommend to do it independently.

    First, in your general project urls.py, enter this code:

    Python
    from django.conf import settings
    from django.conf.urls import include, url

    if settings.DEBUG:
       import debug_toolbar
       urlpatterns += [
           url(r'^__debug__/', include(debug_toolbar.urls)),
       ]
    Take care with the “imports” because it’s possible that you duplicate some of this.

    In the settings.py we enter our independent conf for this component, like this:

    Python
    DEBUG = True

    if DEBUG:
       INTERNAL_IPS = ('127.0.0.1', 'localhost',)
       MIDDLEWARE_CLASSES += (
           'debug_toolbar.middleware.DebugToolbarMiddleware',
       )

       INSTALLED_APPS += (
           'debug_toolbar',
       )

       DEBUG_TOOLBAR_PANELS = [
           'debug_toolbar.panels.versions.VersionsPanel',
           'debug_toolbar.panels.timer.TimerPanel',
           'debug_toolbar.panels.settings.SettingsPanel',
           'debug_toolbar.panels.headers.HeadersPanel',
           'debug_toolbar.panels.request.RequestPanel',
           'debug_toolbar.panels.sql.SQLPanel',
           'debug_toolbar.panels.staticfiles.StaticFilesPanel',
           'debug_toolbar.panels.templates.TemplatesPanel',
           'debug_toolbar.panels.cache.CachePanel',
           'debug_toolbar.panels.signals.SignalsPanel',
           'debug_toolbar.panels.logging.LoggingPanel',
           'debug_toolbar.panels.redirects.RedirectsPanel',
       ]

       DEBUG_TOOLBAR_CONFIG = {
           'INTERCEPT_REDIRECTS': False,
       }
    The INTERNAL_IPS conf is valid for a local development environment, if your dev env is different, you just change this field with your valid conf.


2. 0 Install GEOIP
    https://stackoverflow.com/questions/20853551/error-while-setting-up-geoip-for-my-site-geoip-path-must-be-a-valid-file-or-dir

    this is my project..

    > root
        > app
            settings.py
            urls.py
            ...
        > static
        > application
        > templates
        manage.py
    1) DOWNLOAD GeoLiteCountry and GeoLiteCity.dat.gz

    2) Create a folder in root called geoip and Put both files inside. Be sure that both files are renamed GeoIPCity.dat and GeoIP.dat

    3) Specify the path in your settings file GEOIP_PATH = os.path.join(BASE_DIR, 'geoip')

    4) make a test

    python manage.py shell
    >>> from django.contrib.gis.geoip import GeoIP
    >>> g = GeoIP()
    >>> g.city('72.14.207.99')
    ..
    and if it stills not working, take a look to the g instance to find out the pointing location:

    >>> print g._city_file
    /home/foo/root/geoip/GeoIPCity.dat
    >>> print g._country_file
    /home/foo/root/geoip/GeoIP.dat
    *In case you get an empty string, try to find the bug. Do not try to re-assign the path by modifying the instance g._city_file=/home/foo/Desktop/GeoIP.0.dat, it won't work !



3.0  -------Django Tracking Analyzer----------
    Installation
    Install Django Tracking Analyzer from PyPI by using pip:

    pip install django-tracking-analyzer
    Add 'django_user_agents' and 'tracking_analyzer' entries to Django INSTALLED_APPS setting.

    Run the migrations to load the Tracker model in your database:

    python manage.py migrate tracking_analyzer
    Install the MaxMind® GeoIP2 datasets. You can do this in two ways:

    4.1. By running the provided management command for this:

    python manage.py install_geoip_dataset
    4.2. Or manually, by following the instructions in GeoIP2 Django documentation.

    ------> /Users/gstearmit/mysite/geoip/GeoLite2-City.mmdb dataset installed and ready for use.


4.0  Geolocation with GeoIP2
     https://docs.djangoproject.com/en/1.10/ref/contrib/gis/geoip2/
     $ brew install libmaxminddb
     https://github.com/maxmind/libmaxminddb

5.0 GEO IP : https://docs.djangoproject.com/en/1.10/ref/contrib/gis/geoip2/
    $ python
    Python 3.6.5 |Anaconda, Inc.| (default, Apr 26 2018, 08:42:37)
    [GCC 4.2.1 Compatible Clang 4.0.1 (tags/RELEASE_401/final)] on darwin
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import geoip2.database
    >>> reader = geoip2.database.Reader('/Users/gstearmit/mysite/geoip/GeoLite2-City.mmdb')
    >>> response = reader.city('128.101.101.101')
    >>> response.country.iso_code
    'US'
    >>> response.country.name
    'United States'

   -------- Example :--------

   >>> from django.contrib.gis.geoip2 import GeoIP2
    >>> g = GeoIP2()
    >>> g.country('google.com')
    {'country_code': 'US', 'country_name': 'United States'}
    >>> g.city('72.14.207.99')
    {'city': 'Mountain View',
    'country_code': 'US',
    'country_name': 'United States',
    'dma_code': 807,
    'latitude': 37.419200897216797,
    'longitude': -122.05740356445312,
    'postal_code': '94043',
    'region': 'CA'}
    >>> g.lat_lon('salon.com')
    (39.0437, -77.4875)
    >>> g.lon_lat('uh.edu')
    (-95.4342, 29.834)
    >>> g.geos('24.124.1.80').wkt
    'POINT (-97 38)'



6.0  OverView Django 2.0  Tracking Analyzer
     good : https://django-tracking-analyzer.readthedocs.io/en/latest/usage.html#overview

   https://github.com/jose-lpa/django-tracking-analyzer
   TEST django-tracking-analyzer
   https://github.com/jose-lpa/django-tracking-analyzer/blob/master/tests
   https://github.com/jose-lpa/django-tracking-analyzer/blob/master/tests/test_admin.py
   https://github.com/jose-lpa/django-tracking-analyzer/blob/master/tests/test_models.py

7.0 Rest API App django  : https://viblo.asia/p/advanced-django-rest-framework-3P0lPkebZox
   $ pip install djangorestframework
   $ pip install markdown
   $ pip install django-filter

   $ curl -i -H "Accept: application/json" http://127.0.0.1:8090/api/posts/
    HTTP/1.1 200 OK
    Date: Wed, 04 Jul 2018 23:55:11 GMT
    Server: WSGIServer/0.2 CPython/3.6.5
    Content-Type: application/json
    Vary: Accept, Cookie
    Allow: GET, POST, HEAD, OPTIONS
    X-Frame-Options: SAMEORIGIN
    Content-Length: 2

    [{"id":3,"title":"Tôi học Django","content":"Đang học Django 2.0","draft":false,"read_time":-1,"updated":"2018-07-04T23:59:29.152836Z","created":"2018-07-04T23:59:29.152880Z"},{"id":2,"title":"chào Django 2.0","content":"Tôi đang lam app rest","draft":false,"read_time":-1,"updated":"2018-07-04T23:58:23.655632Z","created":"2018-07-04T23:58:23.655673Z"},{"id":1,"title":"Xin Chao","content":"Xin chao ngay moi\r\ntoi khoi om roi","draft":false,"read_time":0,"updated":"2018-07-04T23:57:35.427368Z","created":"2018-07-04T23:57:35.427417Z"}]


8.0 TEST UNIT WITH MODUL BLOG  : http://test-driven-django-development.readthedocs.io/en/latest/02-models.html

   $ python manage.py test blog

   System check identified 1 issue (0 silenced).
    ..
    ----------------------------------------------------------------------
    Ran 2 tests in 0.007s

    OK
    Destroying test database for alias 'default'..


9.0 Template Blog
   http://127.0.0.1:8290/blog/1/