
require 'yaml'
topics = YAML.load(`aws sns list-topics --output=yaml`)

topics["Topics"].each do |topic|
    cmd = "aws sns delete-topic --topic-arn \"#{topic["TopicArn"]}\""
    puts cmd
    `#{cmd}`
end