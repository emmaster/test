current_path = File.dirname(__FILE__)
require_relative "file_reader.rb"
answers_path = current_path + "/test_results.txt"
questions_path = current_path + "/questions.txt"

#Читаем из файлов с вопросами и ответами теста
f = FileReader.new
answers = f.read_from_file(answers_path)
questions = f.read_from_file(questions_path)


questions.each do |question|
  puts question
  puts "1 — Да, 2 — Нет, 3 — Иногда"
  ans = STDIN.gets.chomp.to_i until ans == 1 || ans == 2 || ans == 3
  answers << ans
end

score = 0

answers.each do |answer|
  case answer
  when 1 then score +=2
  when 3 then score +=1
  end
end

rez = case score
when 30..31 then answers[0]
when 25..29 then answers[1]
when 19..24 then answers[2]
when 14..18 then answers[3]
when 9..13 then answers[4]
when 4..8 then answers[5]
when 0..3 then answers[6]
end

puts "Вы набрали #{score} баллов и вот что это значит: \n#{rez}"
