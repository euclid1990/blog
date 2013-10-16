$( document ).ready(function() {
    $("select").selectpicker({style: 'btn-wide btn-primary btn-block', menuStyle: 'dropdown-inverse'});
});

function deleteComment(comment_id) {
	  $.ajax({
	    type: 'POST',
	    dataType: 'json',
	    url: '/comments/delete',
	    data: {
	        id: comment_id
	    },
	    success: function (data) {
	        if (data.ERROR == 0) {
	            
	        }
	        else {
	            
	        }
	    }
    }).fail(function (jqXHR, textStatus) {
        console.log(textStatus);
    });
}