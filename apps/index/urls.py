from django.urls import path
from . import views

app_name = 'index'

urlpatterns = [
    path("",views.IndexView.as_view(), name='index'),
    path("login/",views.loginview, name='login'),
    path("register/",views.register, name='register'),
    path("search/",views.search, name='search'),
    path("logout/",views.LogoutView.as_view(), name='logout'),
    path("message/",views.UserInfoView.as_view(), name='message'),
    path("change_nickname/",views.change_nickname, name='change_nickname'),
    path("bind_email/",views.bind_email, name='bind_email'),
    path("send_verification_code/",views.send_verification_code, name='send_verification_code'),
    path("change_password/",views.change_password, name='change_password'),
    path("forgot_password/",views.forgot_password, name='forgot_password'),
    path("show/<int:blog_id>",views.IndexShowView.as_view(), name='show'),
    path("map/", views.MapView.as_view(), name='map'),
]