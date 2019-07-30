require 'sidekiq/api'
require 'date'

# Set cloudwatch config

def handler(event:, context:)
  cloudwatch = Aws::CloudWatch::Client.new(
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['SECRET_ACCESS_KEY']
  )

  # Get enqueued jobs from Redis
  stats = Sidekiq::Stats.new
  enqueued = stats.enqueued

  # Send value of `enqueued` to Cloudwatch
  cloudwatch.put_metric_data(
    namespace: 'Redis',
    metric_data: [
      {
        metric_name: 'Enqueued Jobs',
        dimensions: [
          {
            name: "Site",
            value: "StatsUserNet",
          },
        ],
        timestamp: DateTime.now,
        value: enqueued,
        unit: 'Count'
      }
    ]
  )
end
