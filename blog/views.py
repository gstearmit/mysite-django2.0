from django.http import HttpResponse
from django.template import loader

from blog.models import Entry

def index(request):
    #Template case 1 : loader template
    template = loader.get_template('blog/index.html')
    context = {
        'blogviews': '455',
    }
    return HttpResponse(template.render(context, request))

def detail(request, question_id):
    #Template case 1 : loader template
    queryset = Entry.objects.order_by('-created_at')
    template = loader.get_template('blog/detail.html')
    context = {
        'blogviews': '455',
    }
    return HttpResponse(template.render(context, request))
