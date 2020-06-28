from urllib.parse import urlencode
from django import template
from django.conf import settings


register = template.Library()

@register.simple_tag
def get_login_qq_url():
    params = {
        'response_type': 'code',
        'client_id': 101883649,
        'redirect_uri': "https://www.yeliangzhen.com/login_by_qq",
        'state': "yeliangzhen",
    }
    return 'https://graph.qq.com/oauth2.0/authorize?' + urlencode(params)
