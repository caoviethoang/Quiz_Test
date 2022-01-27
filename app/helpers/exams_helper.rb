module ExamsHelper

  def question_row(row_number, questions)
    start_with = row_number * 5 + 1
    end_with  = 5 * (row_number + 1)
    result = ""
    (start_with..end_with).to_a.each do |num|
      result += content_tag( :div, num, class: "question-circle",
        id: "question-circle-#{questions[num-1].question_id}")
    end
    result.html_safe
  end

  def rows
    total_question = 10
    question_per_row = Settings.shared.question_per_row
    return rows = (total_question / question_per_row).round
  end

  def exam_process(row_number, questions)
    content_tag(:div, class: "question-num") do
      question_row(row_number, questions)
    end
  end
end