"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/dev/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, path
from django.conf import settings

# API
from rest_framework import routers
from rest.views import PostListCreateAPIView, PostDetailUpdateAPIView
router = routers.SimpleRouter()
router.register(r'posts', PostListCreateAPIView, base_name="Posts")     # đăng ký API vào router
router.register(r'posts', PostDetailUpdateAPIView, base_name="Posts")

urlpatterns = [
    # path('', include('polls.urls')),  # index
    path('', include('blog.urls')),  # index
    path('blog/', include('blog.urls')),  # Route Blog

#  App Polls
    path('polls/', include('polls.urls')),  # Route Polls

    path('admin/', admin.site.urls),

    # Tracking
    path('tracking/', include('tracking.urls')),

# API
    path('api/', include(router.urls)),  #  Đăng ký router url vào project url
]

if settings.DEBUG:
   import debug_toolbar
   urlpatterns += [
       path('debug/', include(debug_toolbar.urls)),
   ]
