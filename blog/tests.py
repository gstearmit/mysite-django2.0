from django.test import TestCase
from django.apps import apps
from django.contrib.auth import get_user_model
from .models import Entry
from . import views
from django.urls import resolve
from django.http import HttpRequest

# Create your tests here.

class EntryModelTest(TestCase):

    # def test_gialap_fail(self):
    #     self.fail("TODO Test incomplete")

    def test_string_representation(self):
        entry = Entry(title="My entry title")
        self.assertEqual(str(entry), entry.title)

    def test_verbose_name_plural(self):
        self.assertEqual(str(Entry._meta.verbose_name_plural), "entries")



class ProjectTests(TestCase):

    def test_homepage(self):
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)

class HomePageTests(TestCase):

    """Test whether our blog entries show up on the homepage"""

    def setUp(self):
        self.user = get_user_model().objects.create(username='some_user')

    def test_one_entry(self):
        Entry.objects.create(title='1-title', body='1-body', author=self.user)
        response = self.client.get('/')
        #self.assertContains(response, '1-title')
        #self.assertContains(response, '1-body')

    def test_two_entries(self):
        Entry.objects.create(title='1-title', body='1-body', author=self.user)
        Entry.objects.create(title='2-title', body='2-body', author=self.user)
        response = self.client.get('/')
        #self.assertContains(response, '1-title')
        #self.assertContains(response, '1-body')
        #self.assertContains(response, '2-title')


class HomePageTest(TestCase):
     def test_root_url_resolves_to_home_page_view(self):
         found = resolve('/')
         self.assertEqual(found.func, views.detail())

     def test_home_page_returns_correct_html(self):
         request = HttpRequest()
         response = home_page(request)
         self.assertTrue(response.content.startswith(b'<html>'))
         self.assertIn(b'<title>To-Do lists</title>', response.content)
         self.assertTrue(response.content.endswith(b'</html>'))