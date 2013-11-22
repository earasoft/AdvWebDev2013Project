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
        //e.preventDefault();

        //console.log(e);
        var row=$(this).closest('tr')[0].id;
        console.log('Click destroy link for ' + row);
    })
});

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