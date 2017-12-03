$( document ).on('turbolinks:load',function()
{
    var received_dates=$('#available-date').val();
    var chosen_dates=$('#chosen-date').val();
    var index, curdate;
    var active_date=[];
    var chosen_date=[];
    var default_year, default_month,default_day;
    if (received_dates != undefined){
        var dates = received_dates.split(",");
        for (index = 0; index < dates.length; index++) {
            curdate = dates[index].split("/");
            if (index == 0) {
                default_year = curdate[2];
                default_month = curdate[0] - 1;
                default_day = curdate[1];
            }
            if (curdate[1][0] == '0') {
                curdate[1] = curdate[1].substr(1);
            }
            if (curdate[0][0] == '0') {
                curdate[0] = curdate[0].substr(1);
            }

            active_date.push(curdate[1] + "/" + curdate[0] + "/" + curdate[2]);
        }
    if (chosen_dates != undefined) {
            var chosendates = chosen_dates.split(",");
            for (index = 0; index < chosendates.length; index++) {
                curdate = chosendates[index].split("/");
                if (index == 0) {
                    default_year = curdate[2];
                    default_month = curdate[0] - 1;
                    default_day = curdate[1];
                }
                if (curdate[1][0] == '0') {
                    curdate[1] = curdate[1].substr(1);
                }
                if (curdate[0][0] == '0') {
                    curdate[0] = curdate[0].substr(1);
                }

                chosen_date.push(curdate[1] + "/" + curdate[0] + "/" + curdate[2]);
            }
        }
            //var active_dates = ["8/11/2017", "25/11/2017"];
        $('#datepicker').datepicker(
            {
                defaultViewDate: {year: default_year, month: default_month, day: default_day},
                multidate: true,
                beforeShowDay: function (date) {
                    var d = date;
                    var curr_date = d.getDate();
                    var curr_month = d.getMonth() + 1; //Months are zero based
                    var curr_year = d.getFullYear();
                    var formattedDate = curr_date + "/" + curr_month + "/" + curr_year

                   if($.inArray(formattedDate, chosen_date) != -1){
                        return{
                            classes: 'active'
                        };
                    }
                    else if ($.inArray(formattedDate, active_date) != -1) {
                        return {
                            classes: 'availableDate'
                        };
                    }

                    else {
                        return false
                    }

                }
            });
        $('#datepicker').on('changeDate', function () {
            $('#boat_available_date').val(
                $('#datepicker').datepicker('getFormattedDate')
            );
        });
    }

})
