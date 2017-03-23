require 'faraday'
require 'json'
require 'pp'

ACCESS_ID = "9b654e30-c75e-445e-a17d-6d18f02369ae"

conn = Faraday.new("https://api.sonicapi.com") do |f|
  f.request :multipart
  f.request :url_encoded
  f.adapter :net_http
end

# Upload Local File
payload = { :file => Faraday::UploadIO.new('solo_sax.mp3', 'audio/mp3') }

response = conn.post("/file/upload?access_id=#{ACCESS_ID}&format=json", payload)
puts response.status # Should return 201


# Process Response & store file_id
json_response = JSON.parse(response.body)

p json_response

file_id = json_response["file"]["file_id"]


response2 = conn.post("/analyze/tempo", access_id: ACCESS_ID, format: 'json', input_file: file_id)

p "tempo: #{JSON.parse(response2.body)["auftakt_result"]['overall_tempo_straight']}"


response3 = conn.post("/analyze/key", access_id: ACCESS_ID, format: 'json', input_file: file_id)

p "key: #{JSON.parse(response3.body)['tonart_result']['key']}"

p "key_index: #{JSON.parse(response3.body)['tonart_result']['key_index']}"

response4 = conn.post("/analyze/loudness", access_id: ACCESS_ID, format: 'json', input_file: file_id)

p "loudness: #{JSON.parse(response4.body)['loudness_result']['programme_loudness']}"