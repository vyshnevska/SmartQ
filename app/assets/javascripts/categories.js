$(function(){
    var message_status = $("#status");
    $("td[contenteditable=true]").on('blur', function(){
        var column = $(this).data('column'),
          value = $(this).text(),
          path = $(this).parent().data('url');

        $.ajax({ url: path,
                type:'PUT',
                data: { category : { field: column, value: value }
                }
        })
    });
});