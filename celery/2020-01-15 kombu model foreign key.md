


```
PS D:\github\django-tally> python manage.py runserver
Watching for file changes with StatReloader
Performing system checks...

C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\sklearn\utils\deprec
ation.py:144: FutureWarning: The sklearn.feature_extraction.stop_words module is  deprec
ated in version 0.22 and will be removed in version 0.24. The corresponding classes / fu
nctions should instead be imported from sklearn.feature_extraction.text. Anything that c
annot be imported from sklearn.feature_extraction.text is now part of the private API.
  warnings.warn(message, FutureWarning)
System check identified no issues (0 silenced).
January 15, 2020 - 22:37:46
Django version 3.0.2, using settings 'tally.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CTRL-BREAK.
[15/Jan/2020 22:41:21] "GET /yelp/jga_2HO_j4I7tSYf5cCEnQ?viztype=1 HTTP/1.1" 200 3110
[15/Jan/2020 22:41:29] "GET /yelp/jga_2HO_j4I7tSYf5cCEnQ?viztype=0 HTTP/1.1" 200 1535
[15/Jan/2020 22:41:38] "GET /yelp/jga_2HO_j4I7tSYf5cCEnQ?viztype=3 HTTP/1.1" 200 1535
[15/Jan/2020 22:41:46] "GET /yelp/jga_2HO_j4I7tSYf5cCEnQ?viztype=3 HTTP/1.1" 200 1535
[15/Jan/2020 22:41:49] "GET /yelp/jga_2HO_j4I7tSYf5cCEnQ?viztype=2 HTTP/1.1" 200 447
[15/Jan/2020 22:42:36] "GET /admin/ HTTP/1.1" 200 9997
[15/Jan/2020 22:42:39] "GET /admin/ HTTP/1.1" 200 9997
[15/Jan/2020 22:42:44] "GET /admin/djcelery/periodictask/ HTTP/1.1" 200 6084
[15/Jan/2020 22:42:45] "GET /admin/jsi18n/ HTTP/1.1" 200 3223
[15/Jan/2020 22:42:50] "GET /admin/djcelery/periodictask/1/change/ HTTP/1.1" 200 12033
[15/Jan/2020 22:42:51] "GET /admin/jsi18n/ HTTP/1.1" 200 3223
[15/Jan/2020 22:49:26] "GET /admin/djcelery/ HTTP/1.1" 200 4300
[15/Jan/2020 22:49:30] "GET /admin/ HTTP/1.1" 200 9997
[15/Jan/2020 22:49:36] "GET /admin/jobs/jobconfig/ HTTP/1.1" 200 4369
[15/Jan/2020 22:49:37] "GET /admin/jsi18n/ HTTP/1.1" 200 3223
[15/Jan/2020 22:49:49] "GET /admin/jobs/ HTTP/1.1" 200 2438
[15/Jan/2020 22:49:52] "GET /admin/jobs/jobconfig/ HTTP/1.1" 200 4369
[15/Jan/2020 22:49:53] "GET /admin/jsi18n/ HTTP/1.1" 200 3223
[15/Jan/2020 22:49:57] "GET /admin/ HTTP/1.1" 200 9997
[15/Jan/2020 22:50:09] "GET /admin/jobs/jobconfig/ HTTP/1.1" 200 4369
[15/Jan/2020 22:50:09] "GET /admin/jsi18n/ HTTP/1.1" 200 3223
[15/Jan/2020 22:50:13] "GET /admin/ HTTP/1.1" 200 9997
[15/Jan/2020 22:50:17] "GET /admin/djcelery/periodictask/ HTTP/1.1" 200 6084
[15/Jan/2020 22:50:18] "GET /admin/jsi18n/ HTTP/1.1" 200 3223
[15/Jan/2020 22:50:22] "GET /admin/djcelery/periodictask/1/change/ HTTP/1.1" 200 12033
[15/Jan/2020 22:50:23] "GET /admin/jsi18n/ HTTP/1.1" 200 3223
[15/Jan/2020 22:50:27] "GET /admin/djcelery/periodictask/ HTTP/1.1" 200 6084
D:\github\django-tally\tally\settings.py changed, reloading.
Watching for file changes with StatReloader
Performing system checks...

C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\sklearn\utils\deprec
ation.py:144: FutureWarning: The sklearn.feature_extraction.stop_words module is  deprec
ated in version 0.22 and will be removed in version 0.24. The corresponding classes / fu
nctions should instead be imported from sklearn.feature_extraction.text. Anything that c
annot be imported from sklearn.feature_extraction.text is now part of the private API.
  warnings.warn(message, FutureWarning)
System check identified no issues (0 silenced).
January 15, 2020 - 22:56:32
Django version 3.0.2, using settings 'tally.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CTRL-BREAK.
D:\github\django-tally\tally\settings.py changed, reloading.
Traceback (most recent call last):
  File "manage.py", line 24, in <module>
    main()
  File "manage.py", line 20, in main
    execute_from_command_line(sys.argv)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\core\
management\__init__.py", line 401, in execute_from_command_line
    utility.execute()
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\core\
management\__init__.py", line 345, in execute
    settings.INSTALLED_APPS
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\conf\
__init__.py", line 76, in __getattr__
    self._setup(name)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\conf\
__init__.py", line 63, in _setup
    self._wrapped = Settings(settings_module)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\conf\
__init__.py", line 142, in __init__
    mod = importlib.import_module(self.SETTINGS_MODULE)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\importlib\__init__.py", li
ne 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 994, in _gcd_import
  File "<frozen importlib._bootstrap>", line 971, in _find_and_load
  File "<frozen importlib._bootstrap>", line 941, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
  File "<frozen importlib._bootstrap>", line 994, in _gcd_import
  File "<frozen importlib._bootstrap>", line 971, in _find_and_load
  File "<frozen importlib._bootstrap>", line 955, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 665, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 678, in exec_module
  File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
  File "D:\github\django-tally\tally\__init__.py", line 5, in <module>
    from .celery import app as celery_app
  File "D:\github\django-tally\tally\celery.py", line 10, in <module>
    django.setup()
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\__ini
t__.py", line 24, in setup
    apps.populate(settings.INSTALLED_APPS)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\apps\
registry.py", line 114, in populate
    app_config.import_models()
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\apps\
config.py", line 211, in import_models
    self.models_module = import_module(models_module_name)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\importlib\__init__.py", li
ne 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\kombu\transp
ort\django\models.py", line 24, in <module>
    class Message(models.Model):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\kombu\transp
ort\django\models.py", line 29, in Message
    queue = models.ForeignKey(Queue, related_name='messages')
TypeError: __init__() missing 1 required positional argument: 'on_delete'
```

```
PS D:\github\django-tally> python manage.py celery worker --loglevel=info
Traceback (most recent call last):
  File "manage.py", line 24, in <module>
    main()
  File "manage.py", line 20, in main
    execute_from_command_line(sys.argv)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\core\
management\__init__.py", line 401, in execute_from_command_line
    utility.execute()
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\core\
management\__init__.py", line 345, in execute
    settings.INSTALLED_APPS
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\conf\
__init__.py", line 76, in __getattr__
    self._setup(name)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\conf\
__init__.py", line 63, in _setup
    self._wrapped = Settings(settings_module)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\conf\
__init__.py", line 142, in __init__
    mod = importlib.import_module(self.SETTINGS_MODULE)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\importlib\__init__.py", li
ne 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 994, in _gcd_import
  File "<frozen importlib._bootstrap>", line 971, in _find_and_load
  File "<frozen importlib._bootstrap>", line 941, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
  File "<frozen importlib._bootstrap>", line 994, in _gcd_import
  File "<frozen importlib._bootstrap>", line 971, in _find_and_load
  File "<frozen importlib._bootstrap>", line 955, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 665, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 678, in exec_module
  File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
  File "D:\github\django-tally\tally\__init__.py", line 5, in <module>
    from .celery import app as celery_app
  File "D:\github\django-tally\tally\celery.py", line 10, in <module>
    django.setup()
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\__ini
t__.py", line 24, in setup
    apps.populate(settings.INSTALLED_APPS)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\apps\
registry.py", line 114, in populate
    app_config.import_models()
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\apps\
config.py", line 211, in import_models
    self.models_module = import_module(models_module_name)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\importlib\__init__.py", li
ne 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\kombu\transp
ort\django\models.py", line 24, in <module>
    class Message(models.Model):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\kombu\transp
ort\django\models.py", line 29, in Message
    queue = models.ForeignKey(Queue, related_name='messages')
TypeError: __init__() missing 1 required positional argument: 'on_delete'
PS D:\github\django-tally> python manage.py migrate
Traceback (most recent call last):
  File "manage.py", line 24, in <module>
    main()
  File "manage.py", line 20, in main
    execute_from_command_line(sys.argv)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\core\
management\__init__.py", line 401, in execute_from_command_line
    utility.execute()
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\core\
management\__init__.py", line 345, in execute
    settings.INSTALLED_APPS
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\conf\
__init__.py", line 76, in __getattr__
    self._setup(name)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\conf\
__init__.py", line 63, in _setup
    self._wrapped = Settings(settings_module)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\conf\
__init__.py", line 142, in __init__
    mod = importlib.import_module(self.SETTINGS_MODULE)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\importlib\__init__.py", li
ne 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 994, in _gcd_import
  File "<frozen importlib._bootstrap>", line 971, in _find_and_load
  File "<frozen importlib._bootstrap>", line 941, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
  File "<frozen importlib._bootstrap>", line 994, in _gcd_import
  File "<frozen importlib._bootstrap>", line 971, in _find_and_load
  File "<frozen importlib._bootstrap>", line 955, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 665, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 678, in exec_module
  File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
  File "D:\github\django-tally\tally\__init__.py", line 5, in <module>
    from .celery import app as celery_app
  File "D:\github\django-tally\tally\celery.py", line 10, in <module>
    django.setup()
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\__ini
t__.py", line 24, in setup
    apps.populate(settings.INSTALLED_APPS)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\apps\
registry.py", line 114, in populate
    app_config.import_models()
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\apps\
config.py", line 211, in import_models
    self.models_module = import_module(models_module_name)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\importlib\__init__.py", li
ne 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\kombu\transp
ort\django\models.py", line 24, in <module>
    class Message(models.Model):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\kombu\transp
ort\django\models.py", line 29, in Message
    queue = models.ForeignKey(Queue, related_name='messages')
TypeError: __init__() missing 1 required positional argument: 'on_delete'
PS D:\github\django-tally>
```

【Error】
```
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\kombu\transp
ort\django\models.py", line 29, in Message
    queue = models.ForeignKey(Queue, related_name='messages')
TypeError: __init__() missing 1 required positional argument: 'on_delete'
```

【Issue Solved】   
https://www.valentinog.com/blog/django-missing-argument-on-delete/   
Up until Django 1.9 the ForeignKey field required a single argument: the model to map to.   
Since Django 2.0 the ForeignKey field requires two positional arguments    
```
on_delete=models.PROTECT 
```


Right now I am using Django==3.0.2 and kombu==4.6.7 (Last released: Dec 7, 2019 https://pypi.org/project/kombu/). Both are the latest versions. I don't think I can downgrade Django. So in deployment on AWS Elastic Beanstalk, I can't use kombu. Kombu is for local use of celery without setting up an instance of RabbitMQ (a message broker).      
https://stackoverflow.com/questions/18133249/django-celery-cannot-connect-to-amqp-guest127-0-0-80005672
     