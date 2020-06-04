from django.apps import AppConfig

default_app_config = "user.UserConfig"

class UserConfig(AppConfig):
    name = 'user'
    verbose_name = "用户信息"  # 在admin站点中显示的名称
    verbose_name_plural = verbose_name  # 显示的复数名称