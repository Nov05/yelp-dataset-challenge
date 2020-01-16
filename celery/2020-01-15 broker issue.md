
```
[2020-01-15 22:45:01,443: ERROR/MainProcess] consumer: Cannot connect to amqp://guest:**@127.0.0.1:5672//: [WinError 10061] No connection could be made because the target machine actively refused it.
Trying again in 8.00 seconds...

[2020-01-15 22:45:10,474: ERROR/MainProcess] consumer: Cannot connect to amqp://guest:**@127.0.0.1:5672//: [WinError 10061] No connection could be made because the target machine actively refused it.
Trying again in 10.00 seconds...

[2020-01-15 22:45:21,519: ERROR/MainProcess] consumer: Cannot connect to amqp://guest:**@127.0.0.1:5672//: [WinError 10061] No connection could be made because the target machine actively refused it.
Trying again in 12.00 seconds...


worker: Hitting Ctrl+C again will terminate all running tasks!

worker: Warm shutdown (MainProcess)
```

【Solution】 Issue seems solved...   
https://stackoverflow.com/questions/18133249/django-celery-cannot-connect-to-amqp-guest127-0-0-80005672
The problem is that you are trying to connect to a local instance of RabbitMQ. Look at this line in your settings.py
```
BROKER_URL = 'amqp://guest:guest@localhost:5672/'
```
If you are working currently on development, you could avoid setting up Rabbit and all the mess around it, and just use a development-version of a Message Queue with the Django Database.

Do this by replacing your previous configuration with
```
BROKER_URL = 'django://' 
```
and add this app:
```
INSTALLED_APPS += ('kombu.transport.django', )

Finally, launch the worker with
```
./manage.py celery worker --loglevel=info
```
Source: http://docs.celeryproject.org/en/latest/getting-started/brokers/django.html