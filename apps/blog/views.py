from django.shortcuts import render,get_object_or_404
from django.views  import View
from .models import Blogs
from comment.models import Comment
from comment.forms import CommentForm
from django.contrib.contenttypes.models import ContentType
import random
from django.core.paginator import Paginator


# Create your views here.


class BlogView(View):
    '''
    YLZ-Blog 主题
    '''

    def get(self,request):
        article_list = Blogs.objects.all()
        news_all_list = Blogs.objects.filter(blog_type=1).order_by("-created_time")
        blog_all = Blogs.objects.all().order_by("-read_num")[:8]  # 推荐的文章
        tags = Blogs.tags.all()
        tags = random.sample(list(tags),10)
        paginator = Paginator(news_all_list, 10)
        page_num = request.GET.get('page', 1)
        page_of_news = paginator.get_page(page_num)
        blogs = page_of_news.object_list
        return render(request,"blog/blog_list.html",locals())

class CodeView(View):
    '''
    IT技术笔记
    '''

    def get(self,request):
        news_all_list = Blogs.objects.filter(blog_type=2).order_by("-created_time")
        blog_all = Blogs.objects.all().order_by("-read_num")[:8]  # 推荐的文章
        tags = Blogs.tags.all()
        tags = random.sample(list(tags), 10)
        paginator = Paginator(news_all_list, 10)
        page_num = request.GET.get('page', 1)
        page_of_news = paginator.get_page(page_num)
        blogs = page_of_news.object_list
        return render(request,"blog/code_list.html",locals())

class EconomicView(View):
    '''
    财经主题
    '''

    def get(self,request):
        article_list = Blogs.objects.all()
        news_all_list = Blogs.objects.filter(blog_type=3).order_by("-created_time")
        blog_all = Blogs.objects.all().order_by("-read_num")[:8]  # 推荐的文章
        tags = Blogs.tags.all()
        tags = random.sample(list(tags),10)
        paginator = Paginator(news_all_list, 10)
        page_num = request.GET.get('page', 1)
        page_of_news = paginator.get_page(page_num)
        blogs = page_of_news.object_list
        return render(request,"blog/economic_list.html",locals())

class LifeView(View):
    '''
    五味生活
    '''

    def get(self,request):
        article_list = Blogs.objects.all()
        news_all_list = Blogs.objects.filter(blog_type=4).order_by("-created_time")
        blog_all = Blogs.objects.all().order_by("-read_num")[:8]  # 推荐的文章
        tags = Blogs.tags.all()
        tags = random.sample(list(tags),10)
        paginator = Paginator(news_all_list, 10)
        page_num = request.GET.get('page', 1)
        page_of_news = paginator.get_page(page_num)
        blogs = page_of_news.object_list
        return render(request,"blog/life_list.html",locals())


class NewsView(View):
    '''
    资讯分享
    '''

    def get(self,request):
        article_list = Blogs.objects.all()
        news_all_list = Blogs.objects.filter(blog_type=5).order_by("-created_time")
        blog_all = Blogs.objects.all().order_by("-read_num")[:8]  # 推荐的文章
        tags = Blogs.tags.all()
        tags = random.sample(list(tags),10)
        paginator = Paginator(news_all_list, 10)
        page_num = request.GET.get('page', 1)
        page_of_news = paginator.get_page(page_num)
        blogs = page_of_news.object_list
        return render(request,"blog/news_list.html",locals())

class BlogShowView(View):
    '''
    Blog详细页
    '''

    def get(self, request,blog_id):
        blog = get_object_or_404(Blogs,id=blog_id)
        tags = blog.tags.all()
        content = ",".join([ str(tag.name) for tag in tags])
        blog_all = Blogs.objects.all().order_by("?")[:8]  # 推荐的文章
        blogs = Blogs.objects.all().order_by("?")[:8]
        news = Blogs.objects.all()
        # 上一篇
        previoud_new = Blogs.objects.filter(created_time__lt=blog.created_time).last()
        # 下一篇
        next_new = Blogs.objects.filter(created_time__gt=blog.created_time).first()
        if not request.COOKIES.get("blog_%s_read"%blog_id):
            blog.read_num += 1
            blog.save()
        blog_content_type = ContentType.objects.get_for_model(blog)
        comments = Comment.objects.filter(content_type=blog_content_type, object_id=blog.id,parent=None)
        comments_num = Comment.objects.filter(content_type=blog_content_type, object_id=blog.id).count()
        comment_form = CommentForm(initial={'content_type': blog_content_type.model, 'object_id': blog_id,"reply_comment_id":0})
        comments = comments.order_by("-comment_time")
        response = render(request,"blog/blog_show.html", locals())
        response.set_cookie("blog_%s_read"%blog_id,"true",)
        return response



def blog_list(request, tag_slug=None):
    article_list = Blogs.objects.all()
    tags = Blogs.tags.all()
    tags = random.sample(list(tags), 10)
    tag = request.GET.get('tag')
    if tag and tag != 'None':
        article_list = article_list.filter(tags__name__in=[tag])
        article_num = article_list.filter(tags__name__in=[tag]).count()
    paginator = Paginator(article_list, 10)  # 3 posts in each page
    page_num = request.GET.get('page', 1)
    page_of_news = paginator.get_page(page_num)
    blogs = page_of_news.object_list
    return render(request, 'blog/list.html', locals())


class TagsView(View):

    def get(self,request):
        tags = Blogs.tags.all()

        return render(request, 'blog/tags.html', locals())
