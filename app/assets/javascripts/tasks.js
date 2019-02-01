function showForm() {
  var btn = document.getElementById("new-task-form");
  btn.style.height == "100%"
    ? ((btn.style.height = "0px"), (btn.style.opacity = "0"))
    : ((btn.style.height = "100%"), (btn.style.opacity = "1"));
}

jQuery(
  $(document).on("turbolinks:load", function() {
    let subtasks;
    subtasks = $("#task_subproject_id").html();
    return $("#task_project_id").change(function() {
      let project, optons;
      project = $("#task_project_id :selected").text();
      options = $(subtasks)
        .filter("optgroup[label='" + project + "']")
        .html();
      if (options) {
        return $("#task_subproject_id").html(options);
      } else {
        return $("#task_subproject_id").empty();
      }
    });
  })
);
