jQuery(document).ready(function() {
    $("table#posts a.show").bind('click', function(e){
        //disable click while we make a post request
        //e.preventDefault();

        //console.log(e);
        var row=$(this).closest('tr')[0].id;
        console.log('Click show link for ' + row);
    }),
    $("table#posts a.edit").bind('click', function(e){
        //disable click while we make a post request
        //e.preventDefault();

        //console.log(e);
        var row=$(this).closest('tr')[0].id;
        console.log('Click edit link for ' + row);
    }),
    $("table#posts a.destroy").bind('click', function(e){
        //disable click while we make a post request
        e.preventDefault();
        //console.log(e);

        if(confirm("Are you sure?")){
            var row=$(this).closest('tr')[0].id;
            console.log('Click destroy link for ' + row);
            posts_ajax.destroy(row);
            return false;
        }else{
            return false;
        }
    })
});

var posts_ajax = {
     show: function(unique_id){
         $.ajax({
             type: "GET",
             url: "/posts/"+unique_id,
             dataType: "json",
             success: function(e){
                 console.log(e);
             },
             error: function(e){
                 console.log(e);

             }
         });
     },
     destroy : function(unique_id){
         $.ajax({
             type: "POST",
             url: "/posts/"+unique_id,
             dataType: "json",
             data: {"_method":"delete"},
             success: function(){
                 post_table.remove(unique_id);
             },
             error: function(e){

                 var msg;
                 try{
                     msg=JSON.parse(e.responseText).message
                 }catch(ex){
                   msg ="ERROR"
                 };

                 ajax_alert.show(msg);
             }
         });
     }
};

var post_table = {
    list : function(){
        var output = [];
        $('table#posts tbody tr').each(function () {
            if(this.id){
                output.push(this.id);
            };
        });
        return output;
    },
    remove : function(unique_id){
        var output = [];
        $('table#posts tbody tr').each(function () {
            if(this.id==unique_id){
                output.push(this.id);
                $(this).remove()
            };
        });
        return output;
    }
};