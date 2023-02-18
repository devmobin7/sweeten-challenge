
// $(document).ready(function() {
document.addEventListener("turbolinks:load", function() {
  $("input[name='make_contract']").change(function() {
    if ($("input[name='make_contract']:checked").length > 1) {
      $(this).prop('checked', false);
    }
    else {
      project_id = window.location.href.split('/')[window.location.href.split('/').length-1].replace('?', '')

      $.ajax({
        method: 'post',
        url: '/contracts',
        data: {
          renovation_project_id: project_id,
          general_contractor_id: $(this)[0].value
        }
      });
    }
  });

  $('#close_modal').click(function() {
    $("input[name='signed_contract']").prop('checked', true);
  });

  $('#submit_modal').click(function() {
    id = $("input[name='contract_id']").val()
    project_id = window.location.href.split('/')[window.location.href.split('/').length-1].replace('?', '')
    contractor_id = $("input[name='signed_contract']").val()
    rating = $("input[name='rating']").val()

    $.ajax({
      method: 'put',
      url: '/contracts/'+id,
      data: {
        renovation_project_id: project_id,
        general_contractor_id: contractor_id,
        rating: rating
      }
    });
  });

  $("input[name='end_contract']").change(function() {
    id = $("input[name='contract_id']").val()
    contractor_id = window.location.href.split('/')[window.location.href.split('/').length-1].replace('?', '')
    project_id = $(this)[0].value

    $.ajax({
      method: 'put',
      url: '/contracts/'+id,
      data: {
        renovation_project_id: project_id,
        general_contractor_id: contractor_id
      }
    });
  });
});
