from django.contrib import admin
from .models import BlogType,Blogs
# Register your models here.

@admin.register(Blogs)
class BlogAdmin(admin.ModelAdmin):
    list_display = ("id","title","blog_type","author","read_num","created_time")
    list_per_page = 10


@admin.register(BlogType)
class BlogType(admin.ModelAdmin):
    list_display = ("id","blog_type")

