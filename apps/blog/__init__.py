from django.apps import AppConfig

default_app_config = "blog.BlogConfig"
class BlogConfig(AppConfig):
    name = 'blog'
    verbose_name = "博客"  # 在admin站点中显示的名称
    verbose_name_plural = verbose_name  # 显示的复数名称