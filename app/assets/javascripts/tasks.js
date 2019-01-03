

function showForm() {
  const btn = document.getElementById('new-task-form')
  btn.style.display == "block" ? btn.style.display = "none" : btn.style.display = "block"
}

jQuery(function() {
  let subtasks;
  subtasks = $('#task_subproject_id').html();
  return $('#task_project_id').change(function(){
    let project, optons;
    project = $('#task_project_id :selected').text();
    options = $(subtasks).filter("optgroup[label='" + project + "']").html();
    if(options) {
      return $('#task_subproject_id').html(options);
    } else {
      return $('#task_subproject_id').empty();
    }
  });
});
