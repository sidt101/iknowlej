class CourseManager
  attr_accessor :course

  def initialize(course)
    @course = course
  end

  def add_users(users)
    course.users << users
  end

  def remove_users(users)
    course.users.delete(users)
  end
end
