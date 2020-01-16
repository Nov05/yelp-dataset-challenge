

**python manage.py celery worker --loglevel=info** works fine.  
```
PS D:\github\django-tally> python manage.py celery worker --loglevel=info
C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\sklearn\utils\deprec
ation.py:144: FutureWarning: The sklearn.feature_extraction.stop_words module is  deprec
ated in version 0.22 and will be removed in version 0.24. The corresponding classes / fu
nctions should instead be imported from sklearn.feature_extraction.text. Anything that c
annot be imported from sklearn.feature_extraction.text is now part of the private API.
  warnings.warn(message, FutureWarning)
[2020-01-15 23:30:55,872: WARNING/MainProcess] C:\Users\guido\.virtualenvs\django-tally-
QTYVOJb0\lib\site-packages\celery\apps\worker.py:161: CDeprecationWarning:
Starting from version 3.2 Celery will refuse to accept pickle by default.

The pickle serializer is a security concern as it may give attackers
the ability to execute any command.  It's important to secure
your broker from unauthorized access when using pickle, so we think
that enabling pickle should require a deliberate action and not be
the default choice.

If you depend on pickle then you should set a setting to disable this
warning and to be sure that everything will continue working
when you upgrade to Celery 3.2::

    CELERY_ACCEPT_CONTENT = ['pickle', 'json', 'msgpack', 'yaml']

You must only enable the serializers that you will actually use.


  warnings.warn(CDeprecationWarning(W_PICKLE_DEPRECATED))

 -------------- celery@DESKTOP-734EDKI v3.1.26.post2 (Cipater)
---- **** -----
--- * ***  * -- Windows-10-10.0.17763-SP0
-- * - **** ---
- ** ---------- [config]
- ** ---------- .> app:         tally:0x182755000b8
- ** ---------- .> transport:   django://localhost//
- ** ---------- .> results:     disabled://
- *** --- * --- .> concurrency: 8 (prefork)
-- ******* ----
--- ***** ----- [queues]
 -------------- .> celery           exchange=celery(direct) key=celery


[tasks]
  . jobs.tasks.helloworld
  . tally.celery.debug_task

[2020-01-15 23:30:56,047: INFO/MainProcess] Connected to django://localhost//
[2020-01-15 23:30:56,545: INFO/Worker-1] child process 2296 calling self.run()
[2020-01-15 23:30:56,552: INFO/Worker-1] child process 9056 calling self.run()
[2020-01-15 23:30:56,560: INFO/Worker-1] child process 7928 calling self.run()
[2020-01-15 23:30:56,562: INFO/Worker-1] child process 6464 calling self.run()
[2020-01-15 23:30:56,563: INFO/Worker-1] child process 5004 calling self.run()
[2020-01-15 23:30:56,574: INFO/Worker-1] child process 6592 calling self.run()
[2020-01-15 23:30:56,616: INFO/Worker-1] child process 9664 calling self.run()
[2020-01-15 23:30:56,639: INFO/Worker-1] child process 7528 calling self.run()
[2020-01-15 23:30:57,378: WARNING/MainProcess] C:\Users\guido\.virtualenvs\django-tally-
QTYVOJb0\lib\site-packages\celery\fixups\django.py:265: UserWarning: Using settings.DEBU
G leads to a memory leak, never use this setting in production environments!
  warnings.warn('Using settings.DEBUG leads to a memory leak, never '
[2020-01-15 23:30:57,383: WARNING/MainProcess] celery@DESKTOP-734EDKI ready.
C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\sklearn\utils\deprec
ation.py:144: FutureWarning: The sklearn.feature_extraction.stop_words module is  deprec
ated in version 0.22 and will be removed in version 0.24. The corresponding classes / fu
nctions should instead be imported from sklearn.feature_extraction.text. Anything that c
annot be imported from sklearn.feature_extraction.text is now part of the private API.
  warnings.warn(message, FutureWarning)
C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\sklearn\utils\deprec
ation.py:144: FutureWarning: The sklearn.feature_extraction.stop_words module is  deprec
ated in version 0.22 and will be removed in version 0.24. The corresponding classes / fu
nctions should instead be imported from sklearn.feature_extraction.text. Anything that c
annot be imported from sklearn.feature_extraction.text is now part of the private API.
  warnings.warn(message, FutureWarning)
C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\sklearn\utils\deprec
ation.py:144: FutureWarning: The sklearn.feature_extraction.stop_words module is  deprec
ated in version 0.22 and will be removed in version 0.24. The corresponding classes / fu
nctions should instead be imported from sklearn.feature_extraction.text. Anything that c
annot be imported from sklearn.feature_extraction.text is now part of the private API.
  warnings.warn(message, FutureWarning)
C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\sklearn\utils\deprec
ation.py:144: FutureWarning: The sklearn.feature_extraction.stop_words module is  deprec
ated in version 0.22 and will be removed in version 0.24. The corresponding classes / fu
nctions should instead be imported from sklearn.feature_extraction.text. Anything that c
annot be imported from sklearn.feature_extraction.text is now part of the private API.
  warnings.warn(message, FutureWarning)
C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\sklearn\utils\deprec
ation.py:144: FutureWarning: The sklearn.feature_extraction.stop_words module is  deprec
ated in version 0.22 and will be removed in version 0.24. The corresponding classes / fu
nctions should instead be imported from sklearn.feature_extraction.text. Anything that c
annot be imported from sklearn.feature_extraction.text is now part of the private API.
  warnings.warn(message, FutureWarning)
C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\sklearn\utils\deprec
ation.py:144: FutureWarning: The sklearn.feature_extraction.stop_words module is  deprec
ated in version 0.22 and will be removed in version 0.24. The corresponding classes / fu
nctions should instead be imported from sklearn.feature_extraction.text. Anything that c
annot be imported from sklearn.feature_extraction.text is now part of the private API.
  warnings.warn(message, FutureWarning)
C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\sklearn\utils\deprec
ation.py:144: FutureWarning: The sklearn.feature_extraction.stop_words module is  deprec
ated in version 0.22 and will be removed in version 0.24. The corresponding classes / fu
nctions should instead be imported from sklearn.feature_extraction.text. Anything that c
annot be imported from sklearn.feature_extraction.text is now part of the private API.
  warnings.warn(message, FutureWarning)
C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\sklearn\utils\deprec
ation.py:144: FutureWarning: The sklearn.feature_extraction.stop_words module is  deprec
ated in version 0.22 and will be removed in version 0.24. The corresponding classes / fu
nctions should instead be imported from sklearn.feature_extraction.text. Anything that c
annot be imported from sklearn.feature_extraction.text is now part of the private API.
  warnings.warn(message, FutureWarning)
[2020-01-15 23:36:28,322: INFO/MainProcess] Received task: jobs.tasks.helloworld[ce9c5ac
d-1387-4320-85ec-509302006bb4]
[2020-01-15 23:36:28,330: WARNING/Worker-1] hello world
[2020-01-15 23:36:28,331: INFO/MainProcess] Task jobs.tasks.helloworld[ce9c5acd-1387-432
0-85ec-509302006bb4] succeeded in 0s: None
[2020-01-15 23:36:56,385: INFO/MainProcess] Received task: jobs.tasks.helloworld[9885e7a
7-bdfd-473d-927f-de411b11eb53]
[2020-01-15 23:36:56,386: WARNING/Worker-1] hello world
[2020-01-15 23:36:56,387: INFO/MainProcess] Task jobs.tasks.helloworld[9885e7a7-bdfd-473
d-927f-de411b11eb53] succeeded in 0s: None
[2020-01-15 23:36:56,685: INFO/MainProcess] Received task: jobs.tasks.helloworld[b784c16
a-544a-4285-bf17-f88964dab9f7]
[2020-01-15 23:36:56,690: WARNING/Worker-1] hello world
[2020-01-15 23:36:56,690: INFO/MainProcess] Task jobs.tasks.helloworld[b784c16a-544a-428
5-bf17-f88964dab9f7] succeeded in 0s: None
[2020-01-15 23:39:09,186: INFO/MainProcess] Received task: jobs.tasks.helloworld[d5f7c3c
f-0e34-44fc-8c52-359bd0ec69ff]
[2020-01-15 23:39:09,188: WARNING/Worker-1] hello world
[2020-01-15 23:39:09,188: INFO/MainProcess] Task jobs.tasks.helloworld[d5f7c3cf-0e34-44f
c-8c52-359bd0ec69ff] succeeded in 0s: None

worker: Hitting Ctrl+C again will terminate all running tasks!

worker: Warm shutdown (MainProcess)
```


**python manage.py celery beat --loglevel=info** raises errors.  
```
PS D:\github\django-tally> python manage.py celery beat --loglevel=info
celery beat v3.1.26.post2 (Cipater) is starting.
C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\sklearn\utils\deprec
ation.py:144: FutureWarning: The sklearn.feature_extraction.stop_words module is  deprec
ated in version 0.22 and will be removed in version 0.24. The corresponding classes / fu
nctions should instead be imported from sklearn.feature_extraction.text. Anything that c
annot be imported from sklearn.feature_extraction.text is now part of the private API.
  warnings.warn(message, FutureWarning)
__    -    ... __   -        _
Configuration ->
    . broker -> django://localhost//
    . loader -> celery.loaders.app.AppLoader
    . scheduler -> djcelery.schedulers.DatabaseScheduler

    . logfile -> [stderr]@%INFO
    . maxinterval -> now (0s)
[2020-01-15 23:48:06,983: INFO/MainProcess] beat: Starting...
[2020-01-15 23:48:06,984: INFO/MainProcess] Writing entries (0)...
[2020-01-15 23:48:06,984: CRITICAL/MainProcess] beat raised exception <class 'AttributeE
rror'>: AttributeError("'DatabaseFeatures' object has no attribute 'autocommits_when_aut
ocommit_is_off'",)
Traceback (most recent call last):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\kombu\utils\
__init__.py", line 323, in __get__
    return obj.__dict__[self.__name__]
KeyError: 'scheduler'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\celery\apps\
beat.py", line 112, in start_scheduler
    beat.start()
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\celery\beat.
py", line 470, in start
    humanize_seconds(self.scheduler.max_interval))
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\kombu\utils\
__init__.py", line 325, in __get__
    value = obj.__dict__[self.__name__] = self.__get(obj)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\celery\beat.
py", line 512, in scheduler
    return self.get_scheduler()
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\celery\beat.
py", line 507, in get_scheduler
    lazy=lazy)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\celery\utils
\imports.py", line 53, in instantiate
    return symbol_by_name(name)(*args, **kwargs)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\djcelery\sch
edulers.py", line 161, in __init__
    Scheduler.__init__(self, *args, **kwargs)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\celery\beat.
py", line 185, in __init__
    self.setup_schedule()
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\djcelery\sch
edulers.py", line 169, in setup_schedule
    self.install_default_entries(self.schedule)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\djcelery\sch
edulers.py", line 263, in schedule
    self.sync()
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\djcelery\sch
edulers.py", line 217, in sync
    with commit_on_success():
  File "C:\Users\guido\Miniconda3\envs\python3.6\Lib\contextlib.py", line 81, in __enter
__
    return next(self.gen)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\djcelery\db.
py", line 52, in commit_on_success
    if connection.features.autocommits_when_autocommit_is_off:
AttributeError: 'DatabaseFeatures' object has no attribute 'autocommits_when_autocommit_
is_off'
[2020-01-15 23:48:06,988: INFO/MainProcess] Writing entries (0)...
[2020-01-15 23:48:06,988: WARNING/MainProcess] Traceback (most recent call last):
[2020-01-15 23:48:06,989: WARNING/MainProcess] File "C:\Users\guido\Miniconda3\envs\pyth
on3.6\Lib\multiprocessing\util.py", line 262, in _run_finalizers
    finalizer()
[2020-01-15 23:48:06,999: WARNING/MainProcess] File "C:\Users\guido\Miniconda3\envs\pyth
on3.6\Lib\multiprocessing\util.py", line 186, in __call__
    res = self._callback(*self._args, **self._kwargs)
[2020-01-15 23:48:07,000: WARNING/MainProcess] File "C:\Users\guido\.virtualenvs\django-
tally-QTYVOJb0\lib\site-packages\djcelery\schedulers.py", line 217, in sync
    with commit_on_success():
[2020-01-15 23:48:07,001: WARNING/MainProcess] File "C:\Users\guido\Miniconda3\envs\pyth
on3.6\Lib\contextlib.py", line 81, in __enter__
    return next(self.gen)
[2020-01-15 23:48:07,002: WARNING/MainProcess] File "C:\Users\guido\.virtualenvs\django-
tally-QTYVOJb0\lib\site-packages\djcelery\db.py", line 52, in commit_on_success
    if connection.features.autocommits_when_autocommit_is_off:
[2020-01-15 23:48:07,003: WARNING/MainProcess] AttributeError: 'DatabaseFeatures' object
 has no attribute 'autocommits_when_autocommit_is_off'
[2020-01-15 23:48:07,003: INFO/MainProcess] Writing entries (0)...
[2020-01-15 23:48:07,004: WARNING/MainProcess] Traceback (most recent call last):
[2020-01-15 23:48:07,004: WARNING/MainProcess] File "C:\Users\guido\Miniconda3\envs\pyth
on3.6\Lib\multiprocessing\util.py", line 262, in _run_finalizers
    finalizer()
[2020-01-15 23:48:07,005: WARNING/MainProcess] File "C:\Users\guido\Miniconda3\envs\pyth
on3.6\Lib\multiprocessing\util.py", line 186, in __call__
    res = self._callback(*self._args, **self._kwargs)
[2020-01-15 23:48:07,015: WARNING/MainProcess] File "C:\Users\guido\.virtualenvs\django-
tally-QTYVOJb0\lib\site-packages\djcelery\schedulers.py", line 217, in sync
    with commit_on_success():
[2020-01-15 23:48:07,016: WARNING/MainProcess] File "C:\Users\guido\Miniconda3\envs\pyth
on3.6\Lib\contextlib.py", line 81, in __enter__
    return next(self.gen)
[2020-01-15 23:48:07,017: WARNING/MainProcess] File "C:\Users\guido\.virtualenvs\django-
tally-QTYVOJb0\lib\site-packages\djcelery\db.py", line 52, in commit_on_success
    if connection.features.autocommits_when_autocommit_is_off:
[2020-01-15 23:48:07,018: WARNING/MainProcess] AttributeError: 'DatabaseFeatures' object
 has no attribute 'autocommits_when_autocommit_is_off'
PS D:\github\django-tally>
```




































































































