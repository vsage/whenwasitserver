namespace :load_data do
  desc 'Loads questions into the db'
  task load_questions: :environment do
    require 'csv'

    puts 'Opening questions'
    file_path = 'data/Questions.csv'

    # Read csv file
    csv = CSV.read(file_path, headers: :first_row, col_sep: ';', encoding: 'UTF-8')

    Answer.delete_all()
    Question.delete_all()

    # reject rows with 0 value and 0 units and rows with empty category
    csv.reject { |row| () }.each do |row|
      puts row['question']
      categories = row['categories'].split(',')
      puts categories
      @question = Question.create(question: row['question'], categories: categories)
      for i in 1..4
        stringi = i.to_s
        @answer = Answer.new(answer: row['answer'+stringi], right: row['answer'+stringi+'_right'])
        @answer.question = @question
        @answer.save()
      end
    end

    puts 'Done loading questions data'
  end
end
