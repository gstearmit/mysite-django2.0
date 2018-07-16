from selenium import webdriver
browser = webdriver.Firefox()
browser.get('http://localhost:8290')
assert 'Blog' in browser.title