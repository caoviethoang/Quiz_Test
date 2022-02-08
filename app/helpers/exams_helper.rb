module ExamsHelper

  def question_row(row_number, questions)
    start_with = row_number * Settings.shared.question_per_row + 1
    end_with  = Settings.shared.question_per_row * (row_number + 1)
    result = ""
    (start_with..end_with).to_a.each do |num|
      result += content_tag( :div, num, class: "question-circle",
        id: "question-circle-#{questions[num-1].question_id}")
    end
    result.html_safe
  end

  def rows
    (Settings.shared.total_questions / Settings.shared.question_per_row).round
  end

  def exam_process(row_number, questions)
    content_tag(:div, class: "question-num") do
      question_row(row_number, questions)
    end
  end
end