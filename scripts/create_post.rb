require 'date'
require 'securerandom'

# Get the current date
curr_date = DateTime.now

# Get the post title
puts "Enter the post title: "
post_title = gets.chomp

# Get the post date
puts "Enter the post date: [#{curr_date.strftime('%Y-%m-%d %I:%M:%S %Z')}]"
post_date = gets.chomp

if post_date.empty?
    post_date = curr_date
else
    post_date = DateTime.parse(post_date)
end

# Get the post tags
puts 'Enter the post tags: '
post_tags = gets.chomp

post_file_name = "#{post_date.strftime('%Y-%m-%d')}-#{post_title.downcase.gsub(' ', '-')}-#{SecureRandom.alphanumeric[0..7]}.md"
puts "Creating post: #{post_file_name}"

# Create the post file
File.open("_drafts/#{post_file_name}", 'w') do |f|
    f.write("---\n")
    f.write("layout: post\n")
    f.write("title: \"#{post_title}\"\n")
    f.write("date: '#{post_date.strftime('%Y-%m-%d %I:%M:%S %Z')}'\n")
    f.write("tags: #{post_tags}\n")
    f.write("---\n\n\n")
    f.write("## Table of Contents\n{:.no_toc}\n")
end

puts "Post created: #{post_file_name}"