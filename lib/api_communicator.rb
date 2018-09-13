
require 'rest-client'
require 'json'
require 'pry'

def get_random_question_from_api
  # result = []
  binding.pry
  response_string = RestClient.get('https://opentdb.com/api.php?amount=50&category=17&type=multiple')
  response_hash = JSON.parse(response_string)

  while response_hash["next"] != nil
    response_hash["results"].each do |character_info|
      # binding.pry
      if character_info["name"].downcase == character
        return character_info
      end
    end
    response_string = RestClient.get(response_hash["next"])
    response_hash = JSON.parse(response_string)
  end
  return nil
end
