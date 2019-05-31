module TasksHelper
  def sorter(column, title=nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {sort: column, direction: direction}
  end


 def total_time_spent
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
