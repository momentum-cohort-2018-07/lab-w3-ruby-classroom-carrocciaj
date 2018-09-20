# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.
def assignment_score(data, name, score)
    data[name][score-1]
end
  
      

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_scores(data, score)
    data = data.values.map {|x| x[score-1]}
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_average_score(data, score)
    data = data.values.map {|x| x[score-1]}
    data.reduce(:+)/data.length
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
def averages(data)
    data.transform_values do |grades|
        grades.sum/grades.length
    end    
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
def letter_grade(score)
  if score >= 90
    "A"
  elsif score >= 80
    "B"
  elsif score >= 70
    "C"
  elsif score >= 60
    "D"
  else
    "F"
  end
end  

# Return a hash of students and their final letter grade, as determined
# by their average.
def final_letter_grades(data)
  averages(data).transform_values do |grade| 
    letter_grade(grade)
  end
end

# Return the average for the entire class.
def class_average(data)
  score = averages(data).values
  score.sum/score.length
end

# Return an array of the top `number_of_students` students.

