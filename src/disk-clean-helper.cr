# TODO: Write documentation for `Disk::Clean::Helper`
# TODO: should an app be a module? this boilerplate suggest
# TODO: add a flag to select empty files

# module Disk::Clean::Helper
#   VERSION = "0.1.0"
# 
#   # TODO: Put your code here
# end

require "yaml"

seen = {} of String => Array(String)

ARGF.each_line { |l|
    size,filename = l.split(" ",2)
    ( seen[size] ||= [] of String ).push(filename)
}

puts YAML.dump seen.select! { |k,v| k.to_i64 > 0 && v.size > 1 }



