
require 'yaml'
buckets = YAML.load(`aws s3api list-buckets --output=yaml`)

buckets["Buckets"].each do |bucket|
    puts "Deleting bucket #{bucket["Name"]}"
    cmd = "aws s3 rb  \"s3://#{bucket["Name"]}\" --force"
    puts cmd
    `#{cmd}`
end