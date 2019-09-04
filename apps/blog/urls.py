from django.urls import path
from . import views

app_name = 'blog'

urlpatterns = [
    path("",views.BlogView.as_view(), name='blog'),
    path("code/",views.CodeView.as_view(), name='code'),
    path("economic/",views.EconomicView.as_view(), name='economic'),
    path("life/",views.LifeView.as_view(), name='life'),
    path("news/",views.NewsView.as_view(), name='news'),
    path("tags/",views.TagsView.as_view(), name='tags'),
    path("list/",views.blog_list, name='list'),
    path("show/<int:blog_id>",views.BlogShowView.as_view(), name='show')
]