
# Advanced Python Scheduler Background Job Scheduling Example 

On you local machine, start the Django server.    
In the browser, enter the following URL.   
```
http://127.0.0.1:8000/jobs/example
```

## You should be able to see the following output.

```
You started the job scheduler.
... Job 'helloworld' was scheduled.
... Job 'helloworld' was removed.
... The job scheduler has been shut down.

Check your prompt output history.

Note:
Ignore the following Django error message. It is somehow misleading.
... ERROR: django_apscheduler.events:
... ... ... ... ... insert or update on table "django_apscheduler_djangojobexecution"
... ... ... ... ... violates foreign key constraint "django_apscheduler_d_job_id_daf5090a_fk_django_ap".
```

## In your prompt, you should see these texts.

```
INFO:apscheduler.scheduler:Scheduler has been shut down
DEBUG:apscheduler.scheduler:Looking for jobs to run
DEBUG:apscheduler.scheduler:No jobs; waiting until a job is added
[17/Jan/2020 00:08:59] "GET /jobs/example HTTP/1.1" 200 541
D:\github\django-tally\jobs\examples.py changed, reloading.
INFO:django.utils.autoreload:D:\github\django-tally\jobs\examples.py changed, reloading.
Watching for file changes with StatReloader
Performing system checks...

C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\sklearn\utils\deprecation.py:144: FutureWarning: The sklearn.feature_extraction.stop_words module is  deprecated in version 0.22 and will be removed in version 0.24. The corresponding classes / functions should instead be imported from sklearn.feature_extraction.text. Anything that cannot be imported from sklearn.feature_extraction.text is now part of the private API.
  warnings.warn(message, FutureWarning)
System check identified no issues (0 silenced).
January 17, 2020 - 00:12:23
Django version 3.0.2, using settings 'tally.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CTRL-BREAK.
INFO:apscheduler.scheduler:Adding job tentatively -- it will be properly scheduled when the scheduler starts



========================================================
Jobs scheduled:
         helloworld (trigger: interval[0:00:01], pending)
========================================================



INFO:apscheduler.scheduler:Added job "helloworld" to job store "default"
INFO:apscheduler.scheduler:Scheduler started
DEBUG:apscheduler.scheduler:Looking for jobs to run
scheduler.start()
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 00:12:25.031296-06:00 (in 0.314064 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
INFO:apscheduler.executors.default:Running job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 00:12:25 CST)" (scheduled at 2020-01-17 00:12:25.031296-06:00)

  _    _      _ _                            _     _ _
 | |  | |    | | |                          | |   | | |
 | |__| | ___| | | ___   __      _____  _ __| | __| | |
 |  __  |/ _ \ | |/ _ \  \ \ /\ / / _ \| '__| |/ _` | |
 | |  | |  __/ | | (_) |  \ V  V / (_) | |  | | (_| |_|
 |_|  |_|\___|_|_|\___/    \_/\_/ \___/|_|  |_|\__,_(_)


Press Ctrl+Break to exit.

INFO:apscheduler.executors.default:Job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 00:12:26 CST)" executed successfully
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 00:12:26.031296-06:00 (in 0.470284 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
INFO:apscheduler.executors.default:Running job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 00:12:26 CST)" (scheduled at 2020-01-17 00:12:26.031296-06:00)

  _    _      _ _                            _     _ _
 | |  | |    | | |                          | |   | | |
 | |__| | ___| | | ___   __      _____  _ __| | __| | |
 |  __  |/ _ \ | |/ _ \  \ \ /\ / / _ \| '__| |/ _` | |
 | |  | |  __/ | | (_) |  \ V  V / (_) | |  | | (_| |_|
 |_|  |_|\___|_|_|\___/    \_/\_/ \___/|_|  |_|\__,_(_)


Press Ctrl+Break to exit.

INFO:apscheduler.executors.default:Job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 00:12:27 CST)" executed successfully
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 00:12:27.031296-06:00 (in 0.626973 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
INFO:apscheduler.executors.default:Running job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 00:12:27 CST)" (scheduled at 2020-01-17 00:12:27.031296-06:00)

  _    _      _ _                            _     _ _
 | |  | |    | | |                          | |   | | |
 | |__| | ___| | | ___   __      _____  _ __| | __| | |
 |  __  |/ _ \ | |/ _ \  \ \ /\ / / _ \| '__| |/ _` | |
 | |  | |  __/ | | (_) |  \ V  V / (_) | |  | | (_| |_|
 |_|  |_|\___|_|_|\___/    \_/\_/ \___/|_|  |_|\__,_(_)


Press Ctrl+Break to exit.

INFO:apscheduler.executors.default:Job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 00:12:28 CST)" executed successfully
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 00:12:28.031296-06:00 (in 0.612975 seconds)
INFO:apscheduler.scheduler:Removed job helloworld
ERROR:django_apscheduler.events:insert or update on table "django_apscheduler_djangojobexecution" violates foreign key constraint "django_apscheduler_d_job_id_daf5090a_fk_django_ap"
DETAIL:  Key (job_id)=(20) is not present in table "django_apscheduler_djangojob".
Traceback (most recent call last):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\db\backends\utils.py", line 86, in _execute
    return self.cursor.execute(sql, params)
psycopg2.errors.ForeignKeyViolation: insert or update on table "django_apscheduler_djangojobexecution" violates foreign key constraint "django_apscheduler_d_job_id_daf5090a_fk_django_ap"
DETAIL:  Key (job_id)=(20) is not present in table "django_apscheduler_djangojob".


The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django_apscheduler\jobstores.py", line 193, in __call__
    self._process_execution_event(event)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django_apscheduler\jobstores.py", line 217, in _process_execution_event
    self.storage.register_job_executed(job, event)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django_apscheduler\result_storage.py", line 88, in register_job_executed
    job_execution.save()
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\db\models\base.py", line 746, in save
    force_update=force_update, update_fields=update_fields)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\db\models\base.py", line 784, in save_base
    force_update, using, update_fields,
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\db\models\base.py", line 887, in _save_table
    results = self._do_insert(cls._base_manager, using, fields, returning_fields, raw)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\db\models\base.py", line 926, in _do_insert
    using=using, raw=raw,
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\db\models\manager.py", line 82, in manager_method
    return getattr(self.get_queryset(), name)(*args, **kwargs)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\db\models\query.py", line 1204, in _insert
    return query.get_compiler(using=using).execute_sql(returning_fields)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\db\models\sql\compiler.py", line 1384, in execute_sql
    cursor.execute(sql, params)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\db\backends\utils.py", line 100, in execute
    return super().execute(sql, params)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\db\backends\utils.py", line 68, in execute
    return self._execute_with_wrappers(sql, params, many=False, executor=self._execute)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\db\backends\utils.py", line 77, in _execute_with_wrappers
    return executor(sql, params, many, context)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\db\backends\utils.py", line 86, in _execute
    return self.cursor.execute(sql, params)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\db\utils.py", line 90, in __exit__
    raise dj_exc_value.with_traceback(traceback) from exc_value
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\django\db\backends\utils.py", line 86, in _execute
    return self.cursor.execute(sql, params)
django.db.utils.IntegrityError: insert or update on table "django_apscheduler_djangojobexecution" violates foreign key constraint "django_apscheduler_d_job_id_daf5090a_fk_django_ap"
DETAIL:  Key (job_id)=(20) is not present in table "django_apscheduler_djangojob".

INFO:apscheduler.scheduler:Scheduler has been shut down
DEBUG:apscheduler.scheduler:Looking for jobs to run
DEBUG:apscheduler.scheduler:No jobs; waiting until a job is added
[17/Jan/2020 00:12:28] "GET /jobs/example HTTP/1.1" 200 541
```