$(document).on('change', '#states-of-country', function(e) {
    var cities_of_state, input_state, state;
    input_state = $(this);
    cities_of_state = $('#cities-of-state');
    state = this.options[e.target.selectedIndex].id;
    if (state === 'no-state') {
        return cities_of_state.html('');
    } else {
        $.ajax({
            url: '/cities/' + $(this).children(':selected').attr('id'),
            success: function(data) {
                var opt;
                opt = '<option value="" selected>Select Your City</option>';
                if (data.length === 0) {

                } else {
                    data.forEach(function(i) {
                        opt += '<option value="' + i + '">' + i + '</option>';
                    });
                    cities_of_state.html(opt);
                }
            }
        });
    }
});