from django.apps import AppConfig

default_app_config = "index.IndexConfig"

class IndexConfig(AppConfig):
    name = 'apps.index'
    verbose_name = "主页"  # 在admin站点中显示的名称
    verbose_name_plural = verbose_name  # 显示的复数名称
