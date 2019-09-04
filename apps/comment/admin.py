from django.contrib import admin
from .models import Comment
# Register your models here.

@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    list_display = ("id","content_type","object_id","user","content_object","text")
    list_per_page = 10
