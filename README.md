# Sidekiq Queue Monitor

A Ruby script designed to be used with AWS Lambda to send the amount of enqueued jobs in Sidekiq to AWS Cloudwatch.

## Required environment variables

```bash
REDIS_PROVIDER=<your_redis_server_url>
AWS_ACCESS_KEY_ID=<aws_access_key_id>
AWS_SECRET_ACCESS_KEY=<aws_secret_access_key>
```
