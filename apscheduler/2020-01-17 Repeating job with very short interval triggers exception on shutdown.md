
apscheduler 3.0.0 has this issue.  

**Repeating job with very short interval triggers exception on shutdown: 'RuntimeError: cannot schedule new futures after shutdown'**      
#285 Open awlodge opened this issue on Feb 3, 2018 · 4 comments   
https://github.com/agronholm/apscheduler/issues/285   

【Tried to install newer version】【Issue persists】      
APScheduler 3.6.3   
Released: Nov 5, 2019 


```
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 01:46:46.253080-06:00 (in 0.786011 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
ERROR:apscheduler.scheduler:Error submitting job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 01:46:46 CST)" to executor "default"
Traceback (most recent call last):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\schedulers\base.py", line 974, in _process_jobs
    executor.submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\base.py", line 71, in submit_job
    self._do_submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\pool.py", line 22, in _do_submit_job
    f = self._pool.submit(run_job, job, job._jobstore_alias, run_times, self._logger.name)
  File "d:\users\guido\appdata\local\continuum\miniconda3\envs\python3.6\Lib\concurrent\futures\thread.py", line 117, in submit
    raise RuntimeError('cannot schedule new futures after shutdown')
RuntimeError: cannot schedule new futures after shutdown
```

```
[17/Jan/2020 01:41:58] "GET /jobs/example HTTP/1.1" 200 541
D:\github\django-tally\jobs\examples.py changed, reloading.
INFO:django.utils.autoreload:D:\github\django-tally\jobs\examples.py changed, reloading.
Watching for file changes with StatReloader
Performing system checks...

C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\sklearn\utils\deprecation.py:144: FutureWarning: The sklearn.feature_extraction.stop_words module is  deprecated in version 0.22 and will be removed in version 0.24. The corresponding classes / functions should instead be imported from sklearn.feature_extraction.text. Anything that cannot be imported from sklearn.feature_extraction.text is now part of the private API.
  warnings.warn(message, FutureWarning)
System check identified no issues (0 silenced).
January 17, 2020 - 01:42:09
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
INFO:apscheduler.executors.default:Running job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 01:45:31 CST)" (scheduled at 2020-01-17 01:45:31.107525-06:00)

  _    _      _ _                            _     _ _
 | |  | |    | | |                          | |   | | |
 | |__| | ___| | | ___   __      _____  _ __| | __| | |
 |  __  |/ _ \ | |/ _ \  \ \ /\ / / _ \| '__| |/ _` | |
 | |  | |  __/ | | (_) |  \ V  V / (_) | |  | | (_| |_|
 |_|  |_|\___|_|_|\___/    \_/\_/ \___/|_|  |_|\__,_(_)


Press Ctrl+Break to exit.

INFO:apscheduler.executors.default:Job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 01:45:32 CST)" executed successfully
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 01:45:32.107525-06:00 (in 0.749372 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
INFO:apscheduler.executors.default:Running job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 01:45:32 CST)" (scheduled at 2020-01-17 01:45:32.107525-06:00)

  _    _      _ _                            _     _ _
 | |  | |    | | |                          | |   | | |
 | |__| | ___| | | ___   __      _____  _ __| | __| | |
 |  __  |/ _ \ | |/ _ \  \ \ /\ / / _ \| '__| |/ _` | |
 | |  | |  __/ | | (_) |  \ V  V / (_) | |  | | (_| |_|
 |_|  |_|\___|_|_|\___/    \_/\_/ \___/|_|  |_|\__,_(_)


Press Ctrl+Break to exit.

INFO:apscheduler.executors.default:Job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 01:45:33 CST)" executed successfully
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 01:45:33.107525-06:00 (in 0.241431 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
INFO:apscheduler.executors.default:Running job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 01:45:33 CST)" (scheduled at 2020-01-17 01:45:33.107525-06:00)

  _    _      _ _                            _     _ _
 | |  | |    | | |                          | |   | | |
 | |__| | ___| | | ___   __      _____  _ __| | __| | |
 |  __  |/ _ \ | |/ _ \  \ \ /\ / / _ \| '__| |/ _` | |
 | |  | |  __/ | | (_) |  \ V  V / (_) | |  | | (_| |_|
 |_|  |_|\___|_|_|\___/    \_/\_/ \___/|_|  |_|\__,_(_)


Press Ctrl+Break to exit.

INFO:apscheduler.executors.default:Job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 01:45:34 CST)" executed successfully
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 01:45:34.107525-06:00 (in 0.623532 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
INFO:apscheduler.scheduler:Removed job helloworld
DEBUG:apscheduler.scheduler:No jobs; waiting until a job is added
INFO:apscheduler.scheduler:Scheduler has been shut down
[17/Jan/2020 01:45:34] "GET /jobs/example HTTP/1.1" 200 541
INFO:apscheduler.scheduler:Adding job tentatively -- it will be properly scheduled when the scheduler starts



========================================================
Jobs scheduled:
         helloworld (trigger: interval[0:00:01], pending)
========================================================



INFO:apscheduler.scheduler:Added job "helloworld" to job store "default"
INFO:apscheduler.scheduler:Scheduler started
DEBUG:apscheduler.scheduler:Looking for jobs to run
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 01:46:00.084919-06:00 (in 0.270870 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
ERROR:apscheduler.scheduler:Error submitting job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 01:46:00 CST)" to executor "default"
Traceback (most recent call last):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\schedulers\base.py", line 974, in _process_jobs
    executor.submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\base.py", line 71, in submit_job
    self._do_submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\pool.py", line 22, in _do_submit_job
    f = self._pool.submit(run_job, job, job._jobstore_alias, run_times, self._logger.name)
  File "d:\users\guido\appdata\local\continuum\miniconda3\envs\python3.6\Lib\concurrent\futures\thread.py", line 117, in submit
    raise RuntimeError('cannot schedule new futures after shutdown')
RuntimeError: cannot schedule new futures after shutdown
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 01:46:01.084919-06:00 (in 0.490135 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
ERROR:apscheduler.scheduler:Error submitting job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 01:46:01 CST)" to executor "default"
Traceback (most recent call last):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\schedulers\base.py", line 974, in _process_jobs
    executor.submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\base.py", line 71, in submit_job
    self._do_submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\pool.py", line 22, in _do_submit_job
    f = self._pool.submit(run_job, job, job._jobstore_alias, run_times, self._logger.name)
  File "d:\users\guido\appdata\local\continuum\miniconda3\envs\python3.6\Lib\concurrent\futures\thread.py", line 117, in submit
    raise RuntimeError('cannot schedule new futures after shutdown')
RuntimeError: cannot schedule new futures after shutdown
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 01:46:02.084919-06:00 (in 0.760627 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
ERROR:apscheduler.scheduler:Error submitting job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 01:46:02 CST)" to executor "default"
Traceback (most recent call last):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\schedulers\base.py", line 974, in _process_jobs
    executor.submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\base.py", line 71, in submit_job
    self._do_submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\pool.py", line 22, in _do_submit_job
    f = self._pool.submit(run_job, job, job._jobstore_alias, run_times, self._logger.name)
  File "d:\users\guido\appdata\local\continuum\miniconda3\envs\python3.6\Lib\concurrent\futures\thread.py", line 117, in submit
    raise RuntimeError('cannot schedule new futures after shutdown')
RuntimeError: cannot schedule new futures after shutdown
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 01:46:03.084919-06:00 (in 0.719415 seconds)
INFO:apscheduler.scheduler:Removed job helloworld
INFO:apscheduler.scheduler:Scheduler has been shut down
DEBUG:apscheduler.scheduler:Looking for jobs to run
DEBUG:apscheduler.scheduler:No jobs; waiting until a job is added
[17/Jan/2020 01:46:03] "GET /jobs/example HTTP/1.1" 200 541
INFO:apscheduler.scheduler:Adding job tentatively -- it will be properly scheduled when the scheduler starts



========================================================
Jobs scheduled:
         helloworld (trigger: interval[0:00:01], pending)
========================================================



INFO:apscheduler.scheduler:Added job "helloworld" to job store "default"
INFO:apscheduler.scheduler:Scheduler started
DEBUG:apscheduler.scheduler:Looking for jobs to run
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 01:46:17.715676-06:00 (in 0.234620 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
ERROR:apscheduler.scheduler:Error submitting job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 01:46:17 CST)" to executor "default"
Traceback (most recent call last):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\schedulers\base.py", line 974, in _process_jobs
    executor.submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\base.py", line 71, in submit_job
    self._do_submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\pool.py", line 22, in _do_submit_job
    f = self._pool.submit(run_job, job, job._jobstore_alias, run_times, self._logger.name)
  File "d:\users\guido\appdata\local\continuum\miniconda3\envs\python3.6\Lib\concurrent\futures\thread.py", line 117, in submit
    raise RuntimeError('cannot schedule new futures after shutdown')
RuntimeError: cannot schedule new futures after shutdown
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 01:46:18.715676-06:00 (in 0.454113 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
ERROR:apscheduler.scheduler:Error submitting job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 01:46:18 CST)" to executor "default"
Traceback (most recent call last):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\schedulers\base.py", line 974, in _process_jobs
    executor.submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\base.py", line 71, in submit_job
    self._do_submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\pool.py", line 22, in _do_submit_job
    f = self._pool.submit(run_job, job, job._jobstore_alias, run_times, self._logger.name)
  File "d:\users\guido\appdata\local\continuum\miniconda3\envs\python3.6\Lib\concurrent\futures\thread.py", line 117, in submit
    raise RuntimeError('cannot schedule new futures after shutdown')
RuntimeError: cannot schedule new futures after shutdown
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 01:46:19.715676-06:00 (in 0.750190 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
ERROR:apscheduler.scheduler:Error submitting job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 01:46:19 CST)" to executor "default"
Traceback (most recent call last):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\schedulers\base.py", line 974, in _process_jobs
    executor.submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\base.py", line 71, in submit_job
    self._do_submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\pool.py", line 22, in _do_submit_job
    f = self._pool.submit(run_job, job, job._jobstore_alias, run_times, self._logger.name)
  File "d:\users\guido\appdata\local\continuum\miniconda3\envs\python3.6\Lib\concurrent\futures\thread.py", line 117, in submit
    raise RuntimeError('cannot schedule new futures after shutdown')
RuntimeError: cannot schedule new futures after shutdown
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 01:46:20.715676-06:00 (in 0.766017 seconds)
INFO:apscheduler.scheduler:Removed job helloworld
INFO:apscheduler.scheduler:Scheduler has been shut down
DEBUG:apscheduler.scheduler:Looking for jobs to run
DEBUG:apscheduler.scheduler:No jobs; waiting until a job is added
[17/Jan/2020 01:46:20] "GET /jobs/example HTTP/1.1" 200 541
INFO:apscheduler.scheduler:Adding job tentatively -- it will be properly scheduled when the scheduler starts



========================================================
Jobs scheduled:
         helloworld (trigger: interval[0:00:01], pending)
========================================================



INFO:apscheduler.scheduler:Added job "helloworld" to job store "default"
INFO:apscheduler.scheduler:Scheduler started
DEBUG:apscheduler.scheduler:Looking for jobs to run
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 01:46:44.253080-06:00 (in 0.082710 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
ERROR:apscheduler.scheduler:Error submitting job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 01:46:44 CST)" to executor "default"
Traceback (most recent call last):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\schedulers\base.py", line 974, in _process_jobs
    executor.submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\base.py", line 71, in submit_job
    self._do_submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\pool.py", line 22, in _do_submit_job
    f = self._pool.submit(run_job, job, job._jobstore_alias, run_times, self._logger.name)
  File "d:\users\guido\appdata\local\continuum\miniconda3\envs\python3.6\Lib\concurrent\futures\thread.py", line 117, in submit
    raise RuntimeError('cannot schedule new futures after shutdown')
RuntimeError: cannot schedule new futures after shutdown
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 01:46:45.253080-06:00 (in 0.504339 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
ERROR:apscheduler.scheduler:Error submitting job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 01:46:45 CST)" to executor "default"
Traceback (most recent call last):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\schedulers\base.py", line 974, in _process_jobs
    executor.submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\base.py", line 71, in submit_job
    self._do_submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\pool.py", line 22, in _do_submit_job
    f = self._pool.submit(run_job, job, job._jobstore_alias, run_times, self._logger.name)
  File "d:\users\guido\appdata\local\continuum\miniconda3\envs\python3.6\Lib\concurrent\futures\thread.py", line 117, in submit
    raise RuntimeError('cannot schedule new futures after shutdown')
RuntimeError: cannot schedule new futures after shutdown
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 01:46:46.253080-06:00 (in 0.786011 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
ERROR:apscheduler.scheduler:Error submitting job "helloworld (trigger: interval[0:00:01], next run at: 2020-01-17 01:46:46 CST)" to executor "default"
Traceback (most recent call last):
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\schedulers\base.py", line 974, in _process_jobs
    executor.submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\base.py", line 71, in submit_job
    self._do_submit_job(job, run_times)
  File "C:\Users\guido\.virtualenvs\django-tally-QTYVOJb0\lib\site-packages\apscheduler\executors\pool.py", line 22, in _do_submit_job
    f = self._pool.submit(run_job, job, job._jobstore_alias, run_times, self._logger.name)
  File "d:\users\guido\appdata\local\continuum\miniconda3\envs\python3.6\Lib\concurrent\futures\thread.py", line 117, in submit
    raise RuntimeError('cannot schedule new futures after shutdown')
RuntimeError: cannot schedule new futures after shutdown
DEBUG:apscheduler.scheduler:Next wakeup is due at 2020-01-17 01:46:47.253080-06:00 (in 0.787654 seconds)
DEBUG:apscheduler.scheduler:Looking for jobs to run
INFO:apscheduler.scheduler:Removed job helloworld
DEBUG:apscheduler.scheduler:No jobs; waiting until a job is added
INFO:apscheduler.scheduler:Scheduler has been shut down
[17/Jan/2020 01:46:47] "GET /jobs/example HTTP/1.1" 200 541
```