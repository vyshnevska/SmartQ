namespace :prod_data do
  desc "Seed data with valid quizz"
  task :seed => :environment do
    begin
      category1 = Category.create!(:title => 'Block1', :description => '1 point for each correct answer')
      category2 = Category.create!(:title => 'Block2', :description => '2 points for each correct answer')
      quizz = Quizz.create!(:title => 'Trivial questions', :state => 'draft', :category_id => nil, :options => {'category_level' => 'multiple'})

      # Question 1
      question1 = quizz.questions.create!(:title => "What is the name of Mickey Mouse's pet dog?", :category_id => category1.id)
      question1.answers.create!(:title => 'Goofy', :correct => false)
      question1.answers.create!(:title => 'Pluto', :correct => true)
      question1.answers.create!(:title => 'Donald', :correct => false)

      # Question 2
      question2 = quizz.questions.create!(:title => "What is the general name for a group of wolves?", :category_id => category1.id)
      question2.answers.create!(:title => 'Herd', :correct => false)
      question2.answers.create!(:title => 'Litter', :correct => false)
      question2.answers.create!(:title => 'Pack', :correct => true)

      # Question 3
      question3 = quizz.questions.create!(:title => "Which movie actor uttered the famous words: I will be back", :category_id => category2.id)
      question3.answers.create!(:title => 'Mel Gibson in Lethal Weapon', :correct => false)
      question3.answers.create!(:title => 'Bruce Willis in Die Hard', :correct => false)
      question3.answers.create!(:title => 'Arnold Schwarzenegger in Terminator', :correct => true)

      # Question 4
      question4 = quizz.questions.create!(:title => "Brothers and sisters I have none, but that man's father is my father's son. Who am I?", :category_id => category2.id)
      question4.answers.create!(:title => 'Son', :correct => true)
      question4.answers.create!(:title => 'Grandfather', :correct => false)
      question4.answers.create!(:title => 'Uncle', :correct => false)
      question4.answers.create!(:title => 'Father', :correct => false)
      # "Do they have a 4th of July in Great Britain?"
      # Some month have 30 days, some 31. How many has 28 days?
      # In California, is it possible for a man to marry his widow's sister?
      # What is the longest river in the world?(Nile, Amazon, Mississippi)
      # Who said "One small step for man, one giant leap for mankind"?(John Glenn, Neil Armstrong)
      quizz.set_to_completed!
      puts "Data was successfully populated"
    rescue
      puts "Was unable to populate data"
    end

  end
end
