from django.apps import AppConfig

default_app_config = "comment.CommentConfig"
class CommentConfig(AppConfig):
    name = 'comment'
    verbose_name = "评论"  # 在admin站点中显示的名称
    verbose_name_plural = verbose_name  # 显示的复数名称