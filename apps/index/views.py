from django.shortcuts import render,redirect
import string
import random
import time
from django.http import JsonResponse
from django.views import View
from blog.models import Blogs
from django.core.paginator import Paginator
from django.contrib.auth import login,logout,authenticate
from django.urls import reverse
from .forms import LoginForm,RegForm,ChangeNicknameForm,BindEmailForm,ChangePasswordForm,ForgotPasswordForm
from django.contrib.auth.models import User
from django.contrib.contenttypes.models import ContentType
from comment.models import Comment
from comment.forms import CommentForm
from django.db.models import Q
from user.models import Profile
from django.core.mail import send_mail
# Create your views here.


class IndexView(View):
    """
        显示主页
    """
    def get(self,request):
        news_all_list = Blogs.objects.all().order_by("-created_time")
        blog_all = Blogs.objects.all().order_by("-read_num")[:8]  # 推荐的文章
        new = Blogs.objects.filter().order_by("-read_num")[0]  #推荐的文章
        # tags = Blogs.tags.all()
        # print(tags)
        # # tags = list(set(tags))
        paginator = Paginator(news_all_list, 10)
        page_num = request.GET.get('page', 1)
        page_of_news = paginator.get_page(page_num)
        blogs = page_of_news.object_list
        return render(request,"index/index.html",locals())


class IndexShowView(View):
    '''
        Blog详细页
        '''

    def get(self, request,blog_id):
        blog = Blogs.objects.get(id=blog_id)
        blogs = Blogs.objects.all().order_by("?")[:8]
        if not request.COOKIES.get("blog_%s_read" % blog_id):
            blog.read_num += 1
            blog.save()
        blog_content_type = ContentType.objects.get_for_model(blog)
        comments = Comment.objects.filter(content_type=blog_content_type, object_id=blog.pk)
        comment_form = CommentForm(initial={'content_type': blog_content_type.model, 'object_id': blog_id})
        return render(request, "blog/blog_show.html", locals())


# class LoginView(View):
#     """
#     登录
#     """
#     def get(self,request):
#         login_form = LoginForm()
#         return render(request,"index/login.html",locals())
#
#     def post(self,request):
#         login_form = LoginForm(request.POST)
#         if login_form.is_valid():
#             user = login_form.cleaned_data['user']
#             login(request, user)
#             return redirect(request.GET.get("from",reverse("index:index")))
#         else:
#             login_form = LoginForm()
#         login_form = login_form
#         return render(request, "index/login.html", locals())

def loginview(request):
    if request.method == 'POST':
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user = login_form.cleaned_data['user']
            login(request, user)
            return redirect(request.GET.get('from', reverse('index:index')))
    else:
        login_form = LoginForm()

    context = {}
    context['login_form'] = login_form
    return render(request, 'index/login.html', context)


class LogoutView(View):
    """
     登出
    """
    def get(self,request):
        logout(request)
        return redirect(request.GET.get('from', reverse('index:index')))

class UserInfoView(View):
    """
    个人信息
    """
    def get(self,request):
        return render(request,"index/message.html",locals())

# class RegisterView(View):
#
#     def get(self,request):
#         reg_form = RegForm()
#         return render(request, "index/register.html", locals())
#
#     def post(self,request):
#         reg_form = RegForm(request.POST)
#         if reg_form.is_valid():
#             username = reg_form.cleaned_data["username"]
#             email = reg_form.cleaned_data["email"]
#             password = reg_form.cleaned_data["password"]
#             user = User.objects.create_user(username,email,password)
#             print(user)
#             user.save()
#         #     登录用户
#             user = authenticate(username=username,password=password)
#             login(request, user)
#             return redirect(request.GET.get("from", reverse("index:index")))
#         else:
#             reg_form = RegForm()
#         reg_form = reg_form
#         return render(request,"index/register.html",locals())

def register(request):
    if request.method == 'POST':
        reg_form = RegForm(request.POST,request=request)
        if reg_form.is_valid():
            username = reg_form.cleaned_data['username']
            email = reg_form.cleaned_data['email']
            password = reg_form.cleaned_data['password']
            # 创建用户
            user = User.objects.create_user(username, email, password)
            user.save()
            # 清除session
            del request.session['register_code']
            # 登录用户
            user = authenticate(username=username, password=password)
            login(request, user)
            return redirect(request.GET.get('from', reverse('index:index')))
    else:
        reg_form = RegForm()

    context = {}
    context['reg_form'] = reg_form
    return render(request, 'index/register.html', context)


def search(request):
    search_word = request.GET.get("wd","").strip()
    condition = None
    for word in search_word.split(' '):
        if condition is None:
            condition = Q(title__icontains=word)
        else:
            condition = condition | Q(title__icontains=word)

    search_blogs = []
    if condition is not None:
        # 筛选：搜索
        search_blogs = Blogs.objects.filter(condition)

    paginator = Paginator(search_blogs, 10)
    page_num = request.GET.get('page', 1)  # 获取url的页面参数（GET请求）
    page_of_blogs = paginator.get_page(page_num)
    context ={}
    context["search_word"] = search_word
    context["search_blogs"] = search_blogs
    context['page_of_blogs'] = page_of_blogs
    return render(request,"index/search.html",context)

def change_nickname(request):
    # "修改昵称"
    redirect_to = request.GET.get("from",reverse("index:index"))
    if request.method == "POST":
        form = ChangeNicknameForm(request.POST, user=request.user)
        if form.is_valid():
            nickname_new = form.cleaned_data["nickname_new"]
            profile, create = Profile.objects.get_or_create(user=request.user)
            profile.nickname = nickname_new
            profile.save()
            return redirect(redirect_to)
    else:
        form = ChangeNicknameForm()

    context = {}
    context["form"] = form
    context["page_title"] = "修改或添加昵称"
    context["form_title"] = "修改或添加昵称"
    context["submit_text"] = "确定"
    context["return_back_url"] = redirect_to
    return render(request,"index/form.html",context)

def bind_email(request):
    # "邮箱"
    redirect_to = request.GET.get("from", reverse("index:index"))

    if request.method == "POST":
        form = BindEmailForm(request.POST, request=request)
        if form.is_valid():
            email = form.cleaned_data["email"]
            request.user.email = email
            request.user.save()
            # 清除session
            del request.session['bind_email_code']
        return redirect(redirect_to)
    else:
        form = BindEmailForm()

    context = {}
    context["form"] = form
    context["page_title"] = "绑定邮箱"
    context["form_title"] = "绑定邮箱"
    context["submit_text"] = "绑定"
    context["return_back_url"] = redirect_to
    return render(request, "index/bind_email.html", context)

def send_verification_code(request):
    email = request.GET.get("email", "")
    send_for = request.GET.get('send_for', '')
    data = {}

    if email != "":
        # 生成验证码
        code = ''.join(random.sample(string.ascii_letters + string.digits, 4))
        now = int(time.time())
        send_code_time = request.session.get('send_code_time', 0)
        if now - send_code_time < 60:
            data['status'] = 'ERROR'
        else:
            request.session[send_for] = code
            request.session['send_code_time'] = now

            # 发送邮件
            send_mail(
                '绑定邮箱',
                '验证码：%s' % code,
                '827937539@qq.com',
                [email],
                fail_silently=False,
            )
            data['status'] = 'SUCCESS'
    else:
        data['status'] = 'ERROR'
    return JsonResponse(data)


def change_password(request):
    redirect_to = reverse('index:index')
    if request.method == 'POST':
        form = ChangePasswordForm(request.POST, user=request.user)
        if form.is_valid():
            user = request.user
            old_password = form.cleaned_data['old_password']
            new_password = form.cleaned_data['new_password']
            user.set_password(new_password)
            user.save()
            logout(request)
            return redirect(redirect_to)
    else:
        form = ChangePasswordForm()

    context = {}
    context['page_title'] = '修改密码'
    context['form_title'] = '修改密码'
    context['submit_text'] = '修改'
    context['form'] = form
    context['return_back_url'] = redirect_to
    return render(request, 'index/form.html', context)


def forgot_password(request):
    redirect_to = reverse('index:login')
    if request.method == 'POST':
        form = ForgotPasswordForm(request.POST, request=request)
        if form.is_valid():
            email = form.cleaned_data['email']
            new_password = form.cleaned_data['new_password']
            user = User.objects.get(email=email)
            user.set_password(new_password)
            user.save()
            # 清除session
            del request.session['forgot_password_code']
            return redirect(redirect_to)
    else:
        form = ForgotPasswordForm()

    context = {}
    context['page_title'] = '重置密码'
    context['form_title'] = '重置密码'
    context['submit_text'] = '重置'
    context['form'] = form
    context['return_back_url'] = redirect_to
    return render(request, 'index/forgot_password.html', context)


class MapView(View):
    '''
    站点地图
    '''

    def get(self, request):
        article_list = Blogs.objects.all().order_by("-created_time")
        paginator = Paginator(article_list, 30)
        page_num = request.GET.get('page', 1)
        page_of_news = paginator.get_page(page_num)
        blogs = page_of_news.object_list
        currentr_page_num = page_of_news.number
        page_range = [x for x in range(int(currentr_page_num) - 2, int(currentr_page_num) + 3) if
                      0 < x <= paginator.num_pages]
        return render(request, "index/map.html", locals())
