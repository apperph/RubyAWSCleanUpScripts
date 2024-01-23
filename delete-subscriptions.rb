
require 'yaml'
subscriptions = YAML.load(`aws sns list-subscriptions --output=yaml`)

subscriptions["Subscriptions"].each do |subscription|
    cmd = "aws sns unsubscribe --subscription-arn \"#{subscription["SubscriptionArn"]}\""
    puts cmd
    `#{cmd}`
end