class TodoItem
  DATE_INPUT_FORMAT = '%Y-%m-%dT%H:%M:%S%Z'.freeze
  DATE_DISPLAY_FORMAT = '%b %-d at %l:%M%P'.freeze

  attr_reader :task, :course, :due_date, :display_date, :description

  def initialize(json)
    @task = parse_task(json['type'], json['assignment']['name'])
    @course = Dashboard.CONFIG[:courses][json['course_id']]
    @due_date = parse_due_date(json['assignment']['due_at'])
    @display_date = parse_display_date(due_date)
    @description = json['assignment']['description']
  end

  private

  def parse_task(type, name)
    if type == 'submitting'
      "Submit #{name}"
    else
      "#{type} #{name}"
    end
  end

  def parse_due_date(date_string)
    DateTime.strptime(date_string, DATE_INPUT_FORMAT)
  end

  def parse_display_date(date)
    date.to_time.localtime.strftime(DATE_DISPLAY_FORMAT)
  end
end