class Grade
  attr_reader :grade, :course

  def initialize(json)
    @grade = json['enrollments'][0]['computed_current_score'] || 100
    @course = Dashboard.CONFIG[:courses][json['id']]
  end
end