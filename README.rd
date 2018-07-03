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