module ProjectsHelper
  def project_complete_status
    if @project.precentage_complete.nil?
      return 0
    else
      return @project.precentage_complete
    end
  end

  def project_time_spent
    @timeSum = 0;

    @tasks.each do |tsk|
      @userTask = UserTask.where(task_id: tsk.id);
      if @userTask.count(:id) > 1
        @timeSum += tsk.time * @userTask.count(:id)
      else
        @timeSum += tsk.time
      end

  end
    return @timeSum
  end

end
