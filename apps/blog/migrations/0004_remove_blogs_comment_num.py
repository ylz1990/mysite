# Generated by Django 2.0 on 2019-08-20 12:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0003_blogs_text'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='blogs',
            name='comment_num',
        ),
    ]
