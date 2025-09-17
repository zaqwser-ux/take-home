from selenium import webdriver

def before_all(context):
    options = webdriver.ChromeOptions()
    options.add_argument("--headless")
    context.browser = webdriver.Chrome(options=options)
    context.browser.implicitly_wait(5)

def after_all(context):
    context.browser.quit()