
require 'yaml'
groups = YAML.load(`aws logs describe-log-groups --output=yaml`)

groups["logGroups"].each do |group|
    cmd = "aws logs delete-log-group --log-group-name \"#{group["logGroupName"]}\""
    puts cmd
    `#{cmd}`
end