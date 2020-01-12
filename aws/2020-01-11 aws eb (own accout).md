



```
(base) PS D:\github> cd django-tally
(base) PS D:\github\django-tally> eb init -p python-3.6 django-tally
Application django-tally has been created.
(base) PS D:\github\django-tally> eb create django-tally
Creating application version archive "app-1a6d-200111_005024".
Uploading: [##################################################] 100% Done...
Environment details for: django-tally
  Application name: django-tally
  Region: us-west-2
  Deployed Version: app-1a6d-200111_005024
  Environment ID: e-xccx5xkbyr
  Platform: arn:aws:elasticbeanstalk:us-west-2::platform/Python 3.6 running on 64bit Amazon Linux/2.9.4
  Tier: WebServer-Standard-1.0
  CNAME: UNKNOWN
  Updated: 2020-01-11 06:50:48.757000+00:00
Printing Status:
2020-01-11 06:50:47    INFO    createEnvironment is starting.
2020-01-11 06:50:48    INFO    Using elasticbeanstalk-us-west-2-694341391229 as Amazon S3 storage bucket for environment data.
2020-01-11 06:51:15    INFO    Created security group named: sg-02425e0de27d01f28
2020-01-11 06:51:15    INFO    Created load balancer named: awseb-e-x-AWSEBLoa-1WKN6FA96O9EQ
2020-01-11 06:51:32    INFO    Created security group named: awseb-e-xccx5xkbyr-stack-AWSEBSecurityGroup-1RKDRJ1Q4WZLA
2020-01-11 06:51:32    INFO    Created Auto Scaling launch configuration named: awseb-e-xccx5xkbyr-stack-AWSEBAutoScalingLaunchConfiguration-10LICHTQWDDO8
2020-01-11 06:53:05    INFO    Created Auto Scaling group named: awseb-e-xccx5xkbyr-stack-AWSEBAutoScalingGroup-1TSYHXUXVU5OZ
2020-01-11 06:53:05    INFO    Waiting for EC2 instances to launch. This may take a few minutes.
2020-01-11 06:53:06    INFO    Created Auto Scaling group policy named: arn:aws:autoscaling:us-west-2:694341391229:scalingPolicy:a46d20d3-d4bf-4937-8b42-c1f8cc6605a9:autoScalingGroupName/awseb-e-xccx5xkbyr-stack-AWSEBAutoScalingGroup-1TSYHXUXVU5OZ:policyName/awseb-e-xccx5xkbyr-stack-AWSEBAutoScalingScaleUpPolicy-1HVSACVQOAB68
2020-01-11 06:53:06    INFO    Created Auto Scaling group policy named: arn:aws:autoscaling:us-west-2:694341391229:scalingPolicy:704edf2c-74f8-43f7-a5b7-23b97ee004c1:autoScalingGroupName/awseb-e-xccx5xkbyr-stack-AWSEBAutoScalingGroup-1TSYHXUXVU5OZ:policyName/awseb-e-xccx5xkbyr-stack-AWSEBAutoScalingScaleDownPolicy-AJWM5YTW2B3I
2020-01-11 06:53:06    INFO    Created CloudWatch alarm named: awseb-e-xccx5xkbyr-stack-AWSEBCloudwatchAlarmHigh-174TE9373NGYU
2020-01-11 06:53:21    INFO    Created CloudWatch alarm named: awseb-e-xccx5xkbyr-stack-AWSEBCloudwatchAlarmLow-1XMSRNIJ20VMB
2020-01-11 06:54:49    ERROR   [Instance: i-0d01029710396e672] Command failed on instance. Return code: 1 Output: (TRUNCATED)...packages/srsly/msgpack/__init__.py", line 60, in unpackb
return _unpackb(packed, **kwargs)
File "_unpacker.pyx", line 191, in srsly.msgpack._unpacker.unpackb
UnicodeDecodeError: 'utf-8' codec can't decode byte 0xde in position 0: invalid continuation byte.
container_command 01_migrate in .ebextensions/db-migrate.config failed. For more detail, check /var/log/eb-activity.log using console or EB CLI.
2020-01-11 06:54:49    INFO    Command execution completed on all instances. Summary: [Successful: 0, Failed: 1].
2020-01-11 06:55:51    ERROR   Create environment operation is complete, but with errors. For more information, see troubleshooting documentation.

ERROR: ServiceError - Create environment operation is complete, but with errors. For more information, see troubleshooting documentation.
```
### Issue   
UnicodeDecodeError: 'utf-8' codec can't decode byte 0xde in position 0: invalid continuation byte.
container_command 01_migrate in .ebextensions/db-migrate.config failed.    

ascii encoding failure under Python 3 on EC2 / Elastic Beanstalk    
https://github.com/pyinvoke/invoke/issues/377    

https://docs.djangoproject.com/en/3.0/ref/unicode/
If you intend to allow users to upload files, you must ensure that the environment used to run Django is configured to work with non-ASCII file names. If your environment isn’t configured correctly, you’ll encounter UnicodeEncodeError exceptions when saving files with file names that contain non-ASCII characters.

Filesystem support for UTF-8 file names varies and might depend on the environment. Check your current configuration in an interactive Python shell by running:
```
import sys
sys.getfilesystemencoding()
```
This should output “UTF-8”.

The LANG environment variable is responsible for setting the expected encoding on Unix platforms. Consult the documentation for your operating system and application server for the appropriate syntax and location to set this variable.

In your development environment, you might need to add a setting to your ~.bashrc analogous to::
```
export LANG="en_US.UTF-8"
```

### Reset encodings
```
(base) C:\Users\guido>python -c "import locale; print(locale.getpreferredencoding())"
cp65001
(base) C:\Users\guido>python
Python 3.7.4 (default, Aug  9 2019, 18:34:13) [MSC v.1915 64 bit (AMD64)] :: Anaconda, Inc. on win32
Type "help", "copyright", "credits" or "license" for more information.
>>> import sys, locale
>>> print(sys.getdefaultencoding())
utf-8
>>> print(locale.getpreferredencoding())
cp65001
>>> exit()
(base) C:\Users\guido>set LC_CTYPE="en_US.UTF-8"
(base) C:\Users\guido>set LC_ALL=en_US.UTF-8
(base) C:\Users\guido>set LANG=en_US.UTF-8
```

### New deployment
```
(base) D:\github\django-tally>eb init -p python-3.6 django-tally
Application django-tally has been created.

(base) D:\github\django-tally>eb create django-tally
warning: LF will be replaced by CRLF in Pipfile.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in Pipfile.lock.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in en_core_web_sm/__init__.py.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in en_core_web_sm/en_core_web_sm-2.2.5/accuracy.json.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in en_core_web_sm/en_core_web_sm-2.2.5/meta.json.
The file will have its original line endings in your working directory
Creating application version archive "app-13bb-200111_112322".
Uploading: [##################################################] 100% Done...
Environment details for: django-tally
  Application name: django-tally
  Region: us-west-2
  Deployed Version: app-13bb-200111_112322
  Environment ID: e-frqcpsmixy
  Platform: arn:aws:elasticbeanstalk:us-west-2::platform/Python 3.6 running on 64bit Amazon Linux/2.9.4
  Tier: WebServer-Standard-1.0
  CNAME: UNKNOWN
  Updated: 2020-01-11 17:23:46.468000+00:00
Printing Status:
2020-01-11 17:23:45    INFO    createEnvironment is starting.
2020-01-11 17:23:46    INFO    Using elasticbeanstalk-us-west-2-694341391229 as Amazon S3 storage bucket for environment data.
2020-01-11 17:24:07    INFO    Created security group named: sg-031cfb79cd3a9e48a
2020-01-11 17:24:22    INFO    Created load balancer named: awseb-e-f-AWSEBLoa-2GWK1AQ1D5T6
2020-01-11 17:24:22    INFO    Created security group named: awseb-e-frqcpsmixy-stack-AWSEBSecurityGroup-1UNLTSDNJFG3N
2020-01-11 17:24:22    INFO    Created Auto Scaling launch configuration named: awseb-e-frqcpsmixy-stack-AWSEBAutoScalingLaunchConfiguration-GJBJV5CTLYQ2
2020-01-11 17:28:28    INFO    Created Auto Scaling group named: awseb-e-frqcpsmixy-stack-AWSEBAutoScalingGroup-Q7WZ9PVJUXM3
2020-01-11 17:28:29    INFO    Waiting for EC2 instances to launch. This may take a few minutes.
2020-01-11 17:28:29    INFO    Created Auto Scaling group policy named: arn:aws:autoscaling:us-west-2:694341391229:scalingPolicy:b2b64e05-0e07-4b08-bfa9-452b2e50d9c8:autoScalingGroupName/awseb-e-frqcpsmixy-stack-AWSEBAutoScalingGroup-Q7WZ9PVJUXM3:policyName/awseb-e-frqcpsmixy-stack-AWSEBAutoScalingScaleDownPolicy-15S4ZHZ25C6XT
2020-01-11 17:28:29    INFO    Created Auto Scaling group policy named: arn:aws:autoscaling:us-west-2:694341391229:scalingPolicy:007ead3d-0ed2-48bf-af7d-ab946ba35d87:autoScalingGroupName/awseb-e-frqcpsmixy-stack-AWSEBAutoScalingGroup-Q7WZ9PVJUXM3:policyName/awseb-e-frqcpsmixy-stack-AWSEBAutoScalingScaleUpPolicy-PXHSB8V7GZP7
2020-01-11 17:28:29    INFO    Created CloudWatch alarm named: awseb-e-frqcpsmixy-stack-AWSEBCloudwatchAlarmHigh-BH3JRD4MX5KH
2020-01-11 17:28:29    INFO    Created CloudWatch alarm named: awseb-e-frqcpsmixy-stack-AWSEBCloudwatchAlarmLow-B3G2MBDFKO3
2020-01-11 17:29:39    ERROR   [Instance: i-03f8dc47c4a3a6b08] Command failed on instance. Return code: 1 Output: (TRUNCATED)...le>
from tallylib.textrank import yelpTrendyPhrases
File "/opt/python/ondeck/app/tallylib/textrank.py", line 4, in <module>
import en_core_web_sm
File "/opt/python/ondeck/app/en_core_web_sm/__init__.py", line 0
SyntaxError: encoding problem: utf8 with BOM.
container_command 01_migrate in .ebextensions/db-migrate.config failed. For more detail, check /var/log/eb-activity.log using console or EB CLI.
2020-01-11 17:29:39    INFO    Command execution completed on all instances. Summary: [Successful: 0, Failed: 1].
2020-01-11 17:30:42    ERROR   Create environment operation is complete, but with errors. For more information, see troubleshooting documentation.
```

### Got same encoding issue but different error

from tallylib.textrank import yelpTrendyPhrases
File "/opt/python/ondeck/app/tallylib/textrank.py", line 4, in <module>
import en_core_web_sm
File "/opt/python/ondeck/app/en_core_web_sm/__init__.py", line 0
SyntaxError: encoding problem: utf8 with BOM.


### New deployment
```
(base) D:\github\django-tally>eb logs
Retrieving logs...
============= i-0619d2aa42f8235ce ==============
-------------------------------------
/var/log/httpd/error_log
-------------------------------------
[Sun Jan 12 05:15:25.281306 2020] [suexec:notice] [pid 3115] AH01232: suEXEC mechanism enabled (wrapper: /usr/sbin/suexec)
[Sun Jan 12 05:15:25.297134 2020] [http2:warn] [pid 3115] AH10034: The mpm module (prefork.c) is not supported by mod_http2. The mpm determines how things are processed in your server. HTTP/2 has more demands in this regard and the currently selected mpm will just not do. This is an advisory warning. Your server will continue to work, but the HTTP/2 protocol will be inactive.
[Sun Jan 12 05:15:25.297144 2020] [http2:warn] [pid 3115] AH02951: mod_ssl does not seem to be enabled
[Sun Jan 12 05:15:25.297578 2020] [lbmethod_heartbeat:notice] [pid 3115] AH02282: No slotmem from mod_heartmonitor
[Sun Jan 12 05:15:25.297619 2020] [:warn] [pid 3115] mod_wsgi: Compiled for Python/3.6.2.
[Sun Jan 12 05:15:25.297622 2020] [:warn] [pid 3115] mod_wsgi: Runtime using Python/3.6.8.
[Sun Jan 12 05:15:25.299351 2020] [mpm_prefork:notice] [pid 3115] AH00163: Apache/2.4.41 (Amazon) mod_wsgi/3.5 Python/3.6.8 configured -- resuming normal operations
[Sun Jan 12 05:15:25.299365 2020] [core:notice] [pid 3115] AH00094: Command line: '/usr/sbin/httpd -D FOREGROUND'



-------------------------------------
/opt/python/log/supervisord.log
-------------------------------------
2020-01-12 05:15:23,968 CRIT Supervisor running as root (no user in config file)
2020-01-12 05:15:23,984 INFO RPC interface 'supervisor' initialized
2020-01-12 05:15:23,984 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2020-01-12 05:15:23,984 INFO supervisord started with pid 3031
2020-01-12 05:15:24,988 INFO spawned: 'httpd' with pid 3115
2020-01-12 05:15:26,281 INFO success: httpd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)

-------------------------------------
/var/log/httpd/access_log
-------------------------------------

-------------------------------------
/var/log/eb-activity.log
-------------------------------------
  Completed successfully.
[2020-01-12T05:16:42.754Z] INFO  [3168]  - [Application deployment app-caf4-200111_231333@1/StartupStage0/EbExtensionPostBuild/Infra-EmbeddedPostBuild/postbuild_0_django_tally/Command 01_migrate] : Starting activity...
[2020-01-12T05:16:45.918Z] INFO  [3168]  - [Application deployment app-caf4-200111_231333@1/StartupStage0/EbExtensionPostBuild/Infra-EmbeddedPostBuild/postbuild_0_django_tally/Command 01_migrate] : Activity execution failed, because: /opt/python/run/venv/local/lib64/python3.6/site-packages/sklearn/utils/deprecation.py:144: FutureWarning: The sklearn.feature_extraction.stop_words module is  deprecated in version 0.22 and will be removed in version 0.24. The corresponding classes / functions should instead be imported from sklearn.feature_extraction.text. Anything that cannot be imported from sklearn.feature_extraction.text is now part of the private API.
  warnings.warn(message, FutureWarning)
  Traceback (most recent call last):
  File "/opt/python/run/venv/bin/django-admin.py", line 5, in <module>
  management.execute_from_command_line()
  File "/opt/python/run/venv/local/lib/python3.6/site-packages/django/core/management/__init__.py", line 401, in execute_from_command_line
  utility.execute()
  File "/opt/python/run/venv/local/lib/python3.6/site-packages/django/core/management/__init__.py", line 395, in execute  self.fetch_command(subcommand).run_from_argv(self.argv)
  File "/opt/python/run/venv/local/lib/python3.6/site-packages/django/core/management/base.py", line 328, in run_from_argv
  self.execute(*args, **cmd_options)
  File "/opt/python/run/venv/local/lib/python3.6/site-packages/django/core/management/base.py", line 366, in execute
  self.check()
  File "/opt/python/run/venv/local/lib/python3.6/site-packages/django/core/management/base.py", line 395, in check
  include_deployment_checks=include_deployment_checks,
  File "/opt/python/run/venv/local/lib/python3.6/site-packages/django/core/management/commands/migrate.py", line 64, in _run_checks
  issues.extend(super()._run_checks(**kwargs))
  File "/opt/python/run/venv/local/lib/python3.6/site-packages/django/core/management/base.py", line 382, in _run_checks  return checks.run_checks(**kwargs)
  File "/opt/python/run/venv/local/lib/python3.6/site-packages/django/core/checks/registry.py", line 72, in run_checks
  new_errors = check(app_configs=app_configs)
  File "/opt/python/run/venv/local/lib/python3.6/site-packages/django/core/checks/urls.py", line 13, in check_url_config  return check_resolver(resolver)
  File "/opt/python/run/venv/local/lib/python3.6/site-packages/django/core/checks/urls.py", line 23, in check_resolver
  return check_method()
  File "/opt/python/run/venv/local/lib/python3.6/site-packages/django/urls/resolvers.py", line 407, in check
  for pattern in self.url_patterns:
  File "/opt/python/run/venv/local/lib/python3.6/site-packages/django/utils/functional.py", line 48, in __get__
  res = instance.__dict__[self.name] = self.func(instance)
  File "/opt/python/run/venv/local/lib/python3.6/site-packages/django/urls/resolvers.py", line 588, in url_patterns
  patterns = getattr(self.urlconf_module, "urlpatterns", self.urlconf_module)
  File "/opt/python/run/venv/local/lib/python3.6/site-packages/django/utils/functional.py", line 48, in __get__
  res = instance.__dict__[self.name] = self.func(instance)
  File "/opt/python/run/venv/local/lib/python3.6/site-packages/django/urls/resolvers.py", line 581, in urlconf_module
  return import_module(self.urlconf_name)
  File "/opt/python/run/venv/lib64/python3.6/importlib/__init__.py", line 126, in import_module
  return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 994, in _gcd_import
  File "<frozen importlib._bootstrap>", line 971, in _find_and_load
  File "<frozen importlib._bootstrap>", line 955, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 665, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 678, in exec_module
  File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
  File "/opt/python/ondeck/app/tally/urls.py", line 23, in <module>
  path('yelp/', include('yelp.urls'))
  File "/opt/python/run/venv/local/lib/python3.6/site-packages/django/urls/conf.py", line 34, in include
  urlconf_module = import_module(urlconf_module)
  File "/opt/python/run/venv/lib64/python3.6/importlib/__init__.py", line 126, in import_module
  return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 994, in _gcd_import
  File "<frozen importlib._bootstrap>", line 971, in _find_and_load
  File "<frozen importlib._bootstrap>", line 955, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 665, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 678, in exec_module
  File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
  File "/opt/python/ondeck/app/yelp/urls.py", line 7, in <module>
  from .views import home
  File "/opt/python/ondeck/app/yelp/views.py", line 11, in <module>
  from tallylib.scattertxt import getDataViztype0
  File "/opt/python/ondeck/app/tallylib/scattertxt.py", line 12, in <module>
  nlp = en_core_web_sm.load()
  File "/opt/python/ondeck/app/en_core_web_sm/__init__.py", line 12, in load
  return load_model_from_init_py(__file__, **overrides)
  File "/opt/python/run/venv/local/lib64/python3.6/site-packages/spacy/util.py", line 228, in load_model_from_init_py
  return load_model_from_path(data_path, meta, **overrides)
  File "/opt/python/run/venv/local/lib64/python3.6/site-packages/spacy/util.py", line 211, in load_model_from_path
  return nlp.from_disk(model_path)
  File "/opt/python/run/venv/local/lib64/python3.6/site-packages/spacy/language.py", line 941, in from_disk
  util.from_disk(path, deserializers, exclude)
  File "/opt/python/run/venv/local/lib64/python3.6/site-packages/spacy/util.py", line 654, in from_disk
  reader(path / key)
  File "/opt/python/run/venv/local/lib64/python3.6/site-packages/spacy/language.py", line 928, in <lambda>
  p, exclude=["vocab"]
  File "tokenizer.pyx", line 526, in spacy.tokenizer.Tokenizer.from_disk
  File "tokenizer.pyx", line 567, in spacy.tokenizer.Tokenizer.from_bytes
  File "/opt/python/run/venv/local/lib64/python3.6/site-packages/spacy/util.py", line 630, in from_bytes
  msg = srsly.msgpack_loads(bytes_data)
  File "/opt/python/run/venv/local/lib64/python3.6/site-packages/srsly/_msgpack_api.py", line 29, in msgpack_loads
  msg = msgpack.loads(data, raw=False, use_list=use_list)
  File "/opt/python/run/venv/local/lib64/python3.6/site-packages/srsly/msgpack/__init__.py", line 60, in unpackb
  return _unpackb(packed, **kwargs)
  File "_unpacker.pyx", line 191, in srsly.msgpack._unpacker.unpackb
  UnicodeDecodeError: 'utf-8' codec can't decode byte 0xde in position 0: invalid continuation byte
   (ElasticBeanstalk::ExternalInvocationError)


[2020-01-12T05:16:45.918Z] INFO  [3168]  - [Application deployment app-caf4-200111_231333@1/StartupStage0/EbExtensionPostBuild/Infra-EmbeddedPostBuild/postbuild_0_django_tally/Command 01_migrate] : Activity failed.
[2020-01-12T05:16:45.918Z] INFO  [3168]  - [Application deployment app-caf4-200111_231333@1/StartupStage0/EbExtensionPostBuild/Infra-EmbeddedPostBuild/postbuild_0_django_tally] : Activity failed.
[2020-01-12T05:16:45.918Z] INFO  [3168]  - [Application deployment app-caf4-200111_231333@1/StartupStage0/EbExtensionPostBuild/Infra-EmbeddedPostBuild] : Activity failed.
[2020-01-12T05:16:45.943Z] INFO  [3168]  - [Application deployment app-caf4-200111_231333@1/StartupStage0/EbExtensionPostBuild] : Activity failed.
[2020-01-12T05:16:45.943Z] INFO  [3168]  - [Application deployment app-caf4-200111_231333@1/StartupStage0] : Activity failed.
[2020-01-12T05:16:45.943Z] INFO  [3168]  - [Application deployment app-caf4-200111_231333@1] : Completed activity. Result:
  Application deployment - Command CMD-Startup failed
[2020-01-12T05:21:23.567Z] INFO  [3529]  - [CMD-TailLogs] : Starting activity...
[2020-01-12T05:21:23.567Z] INFO  [3529]  - [CMD-TailLogs/AddonsBefore] : Starting activity...
[2020-01-12T05:21:23.567Z] INFO  [3529]  - [CMD-TailLogs/AddonsBefore] : Completed activity.
[2020-01-12T05:21:23.567Z] INFO  [3529]  - [CMD-TailLogs/TailLogs] : Starting activity...
[2020-01-12T05:21:23.568Z] INFO  [3529]  - [CMD-TailLogs/TailLogs/TailLogs] : Starting activity...
```

### Same Issue 
```
  File "/opt/python/ondeck/app/yelp/views.py", line 11, in <module>
  from tallylib.scattertxt import getDataViztype0
  File "/opt/python/ondeck/app/tallylib/scattertxt.py", line 12, in <module>
  nlp = en_core_web_sm.load()
  ...
  File "_unpacker.pyx", line 191, in srsly.msgpack._unpacker.unpackb
  UnicodeDecodeError: 'utf-8' codec can't decode byte 0xde in position 0: invalid continuation byte
   (ElasticBeanstalk::ExternalInvocationError)
```

### Install spaCy Model Properly
https://pypi.org/project/spacy/   
https://spacy.io/usage/models    

### Deploy Django

```
(base) D:\github\django-tally>eb init -p python-3.6 django-tally

(base) D:\github\django-tally>eb create django-tally
Creating application version archive "app-fb33-200112_002520".
Uploading django-tally/app-fb33-200112_002520.zip to S3. This may take a while.
Upload Complete.
Environment details for: django-tally
  Application name: django-tally
  Region: us-west-2
  Deployed Version: app-fb33-200112_002520
  Environment ID: e-8vtjfj8jkp
  Platform: arn:aws:elasticbeanstalk:us-west-2::platform/Python 3.6 running on 64bit Amazon Linux/2.9.4
  Tier: WebServer-Standard-1.0
  CNAME: UNKNOWN
  Updated: 2020-01-12 06:25:29.392000+00:00
Printing Status:
2020-01-12 06:25:28    INFO    createEnvironment is starting.
2020-01-12 06:25:29    INFO    Using elasticbeanstalk-us-west-2-694341391229 as Amazon S3 storage bucket for environment data.
2020-01-12 06:25:51    INFO    Created security group named: sg-016d5fdbd9d1f2be4
2020-01-12 06:25:52    INFO    Created load balancer named: awseb-e-8-AWSEBLoa-DIB57VN7TERK
2020-01-12 06:26:07    INFO    Created security group named: awseb-e-8vtjfj8jkp-stack-AWSEBSecurityGroup-19KDY15A6372V
2020-01-12 06:26:07    INFO    Created Auto Scaling launch configuration named: awseb-e-8vtjfj8jkp-stack-AWSEBAutoScalingLaunchConfiguration-G3HJEHG2RGL9
2020-01-12 06:27:25    INFO    Created Auto Scaling group named: awseb-e-8vtjfj8jkp-stack-AWSEBAutoScalingGroup-2EZ3AVH1Q5H6
2020-01-12 06:27:26    INFO    Waiting for EC2 instances to launch. This may take a few minutes.
2020-01-12 06:27:41    INFO    Created Auto Scaling group policy named: arn:aws:autoscaling:us-west-2:694341391229:scalingPolicy:32d7c663-64d0-4a8b-90f8-b12d860724d6:autoScalingGroupName/awseb-e-8vtjfj8jkp-stack-AWSEBAutoScalingGroup-2EZ3AVH1Q5H6:policyName/awseb-e-8vtjfj8jkp-stack-AWSEBAutoScalingScaleUpPolicy-E0LW8JAP3654
2020-01-12 06:27:41    INFO    Created Auto Scaling group policy named: arn:aws:autoscaling:us-west-2:694341391229:scalingPolicy:c1218be4-0202-42a3-aec4-da6dd3f0a784:autoScalingGroupName/awseb-e-8vtjfj8jkp-stack-AWSEBAutoScalingGroup-2EZ3AVH1Q5H6:policyName/awseb-e-8vtjfj8jkp-stack-AWSEBAutoScalingScaleDownPolicy-JL63FCUX9GDU
2020-01-12 06:27:41    INFO    Created CloudWatch alarm named: awseb-e-8vtjfj8jkp-stack-AWSEBCloudwatchAlarmHigh-1JSBO5R05Y5QL
2020-01-12 06:27:41    INFO    Created CloudWatch alarm named: awseb-e-8vtjfj8jkp-stack-AWSEBCloudwatchAlarmLow-1KH17LKLMGGO5
2020-01-12 06:27:53    ERROR   Your requirements.txt is invalid. Snapshot your logs for details.
2020-01-12 06:27:56    ERROR   [Instance: i-07d13982d26133292] Command failed on instance. Return code: 1 Output: (TRUNCATED)...)
  File "/usr/lib64/python2.7/subprocess.py", line 190, in check_call
    raise CalledProcessError(retcode, cmd)
CalledProcessError: Command '/opt/python/run/venv/bin/pip install -r /opt/python/ondeck/app/requirements.txt' returned non-zero exit status 1.
Hook /opt/elasticbeanstalk/hooks/appdeploy/pre/03deploy.py failed. For more detail, check /var/log/eb-activity.log using console or EB CLI.
2020-01-12 06:27:56    INFO    Command execution completed on all instances. Summary: [Successful: 0, Failed: 1].
2020-01-12 06:28:58    ERROR   Create environment operation is complete, but with errors. For more information, see troubleshooting documentation.
```

Logs
```
  Collecting en-core-web-sm==2.2.5 (from -r /opt/python/ondeck/app/requirements.txt (line 15))
    Could not find a version that satisfies the requirement en-core-web-sm==2.2.5 (from -r /opt/python/ondeck/app/requirements.txt (line 15)) (from versions: )
  No matching distribution found for en-core-web-sm==2.2.5 (from -r /opt/python/ondeck/app/requirements.txt (line 15))
  You are using pip version 9.0.1, however version 19.3.1 is available.
  You should consider upgrading via the 'pip install --upgrade pip' command.
  2020-01-12 06:27:53,975 ERROR    Error installing dependencies: Command '/opt/python/run/venv/bin/pip install -r /opt/python/ondeck/app/requirements.txt' returned non-zero exit status 1
  Traceback (most recent call last):
    File "/opt/elasticbeanstalk/hooks/appdeploy/pre/03deploy.py", line 22, in main
      install_dependencies()
    File "/opt/elasticbeanstalk/hooks/appdeploy/pre/03deploy.py", line 18, in install_dependencies
      check_call('%s install -r %s' % (os.path.join(APP_VIRTUAL_ENV, 'bin', 'pip'), requirements_file), shell=True)
    File "/usr/lib64/python2.7/subprocess.py", line 190, in check_call
      raise CalledProcessError(retcode, cmd)
  CalledProcessError: Command '/opt/python/run/venv/bin/pip install -r /opt/python/ondeck/app/requirements.txt' returned non-zero exit status 1 (ElasticBeanstalk::ExternalInvocationError)
```

### Change requirements.txt 
Remove `en_core_web_sm==2.2.5`, add the following lines:  
```
spacy>=2.0.0,<3.0.0
https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-2.2.5/en_core_web_sm-2.2.5.tar.gz
```

# Succeeded
```
Printing Status:
2020-01-12 07:09:31    INFO    createEnvironment is starting.
2020-01-12 07:09:32    INFO    Using elasticbeanstalk-us-west-2-694341391229 as Amazon S3 storage bucket for environment data.
2020-01-12 07:10:08    INFO    Created security group named: sg-01a82093a3b2805e4
2020-01-12 07:10:08    INFO    Created load balancer named: awseb-e-m-AWSEBLoa-TGSYBW4MQ2UB
2020-01-12 07:10:08    INFO    Created security group named: awseb-e-mqeeephzbw-stack-AWSEBSecurityGroup-A9ES9HRDZS69
2020-01-12 07:10:10    INFO    Created Auto Scaling launch configuration named: awseb-e-mqeeephzbw-stack-AWSEBAutoScalingLaunchConfiguration-1QPAC2LS98SJA
2020-01-12 07:11:12    INFO    Created Auto Scaling group named: awseb-e-mqeeephzbw-stack-AWSEBAutoScalingGroup-1ODCOYA6RQ6LZ
2020-01-12 07:11:12    INFO    Waiting for EC2 instances to launch. This may take a few minutes.
2020-01-12 07:11:12    INFO    Created Auto Scaling group policy named: arn:aws:autoscaling:us-west-2:694341391229:scalingPolicy:a3cd6044-387e-44e3-a281-622100763f1a:autoScalingGroupName/awseb-e-mqeeephzbw-stack-AWSEBAutoScalingGroup-1ODCOYA6RQ6LZ:policyName/awseb-e-mqeeephzbw-stack-AWSEBAutoScalingScaleDownPolicy-RHM7TFN7DTAB
2020-01-12 07:11:12    INFO    Created Auto Scaling group policy named: arn:aws:autoscaling:us-west-2:694341391229:scalingPolicy:d24c66c3-6f0f-4be0-a030-b748aa69914c:autoScalingGroupName/awseb-e-mqeeephzbw-stack-AWSEBAutoScalingGroup-1ODCOYA6RQ6LZ:policyName/awseb-e-mqeeephzbw-stack-AWSEBAutoScalingScaleUpPolicy-1B5F47SJN1KOJ
2020-01-12 07:11:28    INFO    Created CloudWatch alarm named: awseb-e-mqeeephzbw-stack-AWSEBCloudwatchAlarmHigh-4D34KF3YSBTW
2020-01-12 07:11:28    INFO    Created CloudWatch alarm named: awseb-e-mqeeephzbw-stack-AWSEBCloudwatchAlarmLow-1MWTOBM1RFLUG
2020-01-12 07:13:24    INFO    Application available at django-tally.y7tbatmffp.us-west-2.elasticbeanstalk.com.
2020-01-12 07:13:25    INFO    Successfully launched environment: django-tally
```



