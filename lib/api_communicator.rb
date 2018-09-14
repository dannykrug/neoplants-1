
require 'rest-client'
require 'json'
require 'pry'

#can call on return value with ["question"], ["correct_answer"], ["incorrect_answers"]#array
def get_random_question_from_api
  response_string = RestClient.get('https://opentdb.com/api.php?amount=50&category=17&type=multiple')
  response_hash = JSON.parse(response_string)
  #get random question
  size = response_hash["results"].count
  rand_i = rand(size)
  return response_hash["results"][rand_i]
  #return random question with keys "question", "correct_answer", "incorrect_answers"
end
