"""RecommendSystem URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
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
from django.conf.urls import url
from RecommendSysApp import views as RecommendSysApp_view
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from RecommendSysApp import admin

urlpatterns = [
    url(r'^$', RecommendSysApp_view.login, name='login'),
    url(r'^login', RecommendSysApp_view.login, name='login'),
    url(r'^index', RecommendSysApp_view.index, name='index'),
    url(r'^admin', RecommendSysApp_view.admin, name='admin'),
    url(r'^manage', admin.admin.site.urls),
    url(r'^left', RecommendSysApp_view.left, name='left'),
    url(r'^count', RecommendSysApp_view.count, name='count'),
    url(r'^monitor', RecommendSysApp_view.monitor, name='monitor'),
    url(r'^ajax/login/', RecommendSysApp_view.ajax_login, name='ajax_login'),
    url(r'^ajax/resultList/', RecommendSysApp_view.resultList, name='ajax_resultList'),
    url(r'^ajax/resultFeedback/', RecommendSysApp_view.resultFeedback, name='ajax_resultFeedback'),
    url(r'^ajax/sysAssess/', RecommendSysApp_view.sysAssess, name='ajax_sysAssess'),
    url(r'^ajax/getCoverage/', RecommendSysApp_view.getCoverage, name='ajax_getCoverage'),
    url(r'^ajax/Progress/', RecommendSysApp_view.Progress, name='ajax_Progress'),
    url(r'^ajax/GetHeartbeat/', RecommendSysApp_view.GetHeartbeat, name='ajax_GetHeartbeat'),

] #  + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

urlpatterns += staticfiles_urlpatterns()
