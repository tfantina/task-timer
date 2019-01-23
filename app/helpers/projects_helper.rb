module ProjectsHelper
  def project_complete_status
    if @project.precentage_complete.nil?
      return 0
    else
      return @project.precentage_complete
    end
  end
end
