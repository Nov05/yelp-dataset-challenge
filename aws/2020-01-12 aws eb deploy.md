

Once you have successfully created AWS Elastic Beanstalk instance, you can use `$ eb deploy` to quickly update your web application. 
```
(base) D:\github\django-tally>eb deploy
Creating application version archive "app-8050-200112_042907".
Uploading django-tally/app-8050-200112_042907.zip to S3. This may take a while.
Upload Complete.
2020-01-12 10:29:13    INFO    Environment update is starting.
2020-01-12 10:29:16    INFO    Deploying new version to instance(s).
2020-01-12 10:29:52    INFO    New application version was deployed to running EC2 instances.
2020-01-12 10:29:52    INFO    Environment update completed successfully.
```

