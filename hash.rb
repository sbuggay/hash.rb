require 'digest/md5'
require 'digest/sha1'
require 'digest/sha2'

require 'optparse'
require 'ostruct'

options = OpenStruct.new
OptionParser.new do |opts|
	opts.banner = "Usage: hash.rb [options]"

	opts.on("-t N", String, "Type of hash") do |n|
		options.type = n
	end

	opts.on("-f", "--files", "Use files") do |f|
		options.files = f
	end

	opts.on("-c x,y", Array, "Example 'list' of arguments") do |list|
		options.list = list
	end

	opts.on_tail("-h", "--help", "Show this message") do
		puts opts
		exit
	end
end.parse!


p options
p options.type

if options.list.any?
	if options.files
		case options.type
		when "md5"
			hash1 = Digest::MD5.file(options.list[0]).hexdigest
			hash2 = Digest::MD5.file(options.list[1]).hexdigest
		when "sha1"
			hash1 = Digest::SHA1.file(options.list[0]).hexdigest
			hash2 = Digest::SHA1.file(options.list[1]).hexdigest
		when "sha2"
			hash1 = Digest::SHA2.file(options.list[0]).hexdigest
			hash2 = Digest::SHA2.file(options.list[1]).hexdigest
		else
			hash1 = Digest::MD5.file(options.list[0]).hexdigest
			hash2 = Digest::MD5.file(options.list[1]).hexdigest
		end
	else
		case options.type
		when "md5"
			hash1 = Digest::MD5.hexdigest(options.list[0])
			hash2 = Digest::MD5.hexdigest(options.list[1])
		when "sha1"
			hash1 = Digest::SHA1.hexdigest(options.list[0])
			hash2 = Digest::SHA1.hexdigest(options.list[1])
		when "sha2"
			hash1 = Digest::SHA2.hexdigest(options.list[0])
			hash2 = Digest::SHA2.hexdigest(options.list[1])
		else
			hash1 = Digest::MD5.hexdigest(options.list[0])
			hash2 = Digest::MD5.hexdigest(options.list[1])
		end
	end
	p hash1
	p hash2


else
	ARGV.each do|a|
		if options.files
			p a
			case options.type
			when "md5"
				hash = Digest::MD5.file(a).hexdigest
			when "sha1"
				hash = Digest::SHA1.file(a).hexdigest
			when "sha2"
				hash = Digest::SHA2.file(a).hexdigest
			else
				hash = Digest::MD5.file(a).hexdigest
			end
		else
			p a
			case options.type
			when "md5"
				hash = Digest::MD5.hexdigest(a)
			when "sha1"
				hash = Digest::SHA1.hexdigest(a)
			when "sha2"
				hash = Digest::SHA2.hexdigest(a)
			else
				hash = Digest::MD5.hexdigest(a)
			end
		end
		p hash

	end
end