from django.db import models
from django.contrib .auth.models import User
from ckeditor_uploader.fields import RichTextUploadingField
from taggit.managers import TaggableManager
# Create your models here.

class BlogType(models.Model):
    blog_type = models.CharField(max_length=20,verbose_name="博客类型",help_text="博客类型")
    is_delete = models.BooleanField(default=False, verbose_name='逻辑删除', help_text="逻辑删除")

    def __str__(self):
        return self.blog_type



class Blogs(models.Model):
    title = models.CharField(max_length=50,verbose_name="博客标题",help_text="博客标题")
    blog_type = models.ForeignKey(BlogType, on_delete=models.DO_NOTHING,verbose_name="博客类型",help_text="博客类型")
    author = models.ForeignKey(User,on_delete=models.DO_NOTHING,verbose_name="博客作者",help_text="博客作者")
    read_num = models.IntegerField(default=0,verbose_name="阅读次数", help_text="阅读次数")
    text = models.TextField(max_length=300,default="",verbose_name="文章摘要", help_text="文章摘要")
    content = RichTextUploadingField(verbose_name="文章", help_text="文章")
    created_time = models.DateTimeField(auto_now_add=True, verbose_name="发布时间", help_text="发布时间")
    img_url = models.ImageField(upload_to='blog', default="", blank=True)  # upload_to指定图片上传的途径，如果不存在则自动创建
    tags = TaggableManager()
    is_delete = models.BooleanField(default=False, verbose_name='逻辑删除', help_text="逻辑删除")


    def __str__(self):
        return "<Blog: %s>" % self.title

    class Meta:
        ordering = ["id",'-created_time']
        db_table = "tb_mysite"  # 指明数据库表名
        verbose_name = "YLZ-博客"  # 在admin站点中显示的名称
        verbose_name_plural = verbose_name  # 显示的复数名称

class Message(models.Model):
    title = models.CharField(max_length=50, verbose_name="标题", help_text="标题")
    created_time = models.DateTimeField(auto_now_add=True, verbose_name="发布时间", help_text="发布时间")
    author = models.ForeignKey(User, on_delete=models.DO_NOTHING, verbose_name="作者", help_text="作者")
    read_num = models.IntegerField(default=0, verbose_name="阅读次数", help_text="阅读次数")
    is_delete = models.BooleanField(default=False, verbose_name='逻辑删除', help_text="逻辑删除")

    def __str__(self):
        return "<Message: %s>" % self.title

    class Meta:
        ordering = ["id",'-created_time']
        db_table = "tb_message"  # 指明数据库表名
        verbose_name = "留言板"  # 在admin站点中显示的名称
        verbose_name_plural = verbose_name  # 显示的复数名称