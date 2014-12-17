// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function fSetBestContact() {
    var HomePhone = document.getElementById('<%= HomePhoneTextBox.ClientID %>').value;
    var WorkPhone = document.getElementById('<%= WorkPhoneTextBox.ClientID %>').value;
    var CellPhone = document.getElementById('<%= CellPhoneTextBox.ClientID %>').value;
    var dropDown = document.getElementById('<%= BestContactDropDownList.ClientID %>');
    var length = dropDown.options.length;
    if (HomePhone != '' && WorkPhone == '' && CellPhone == '') {
        for (var i = 0; i < length; i++) {
            if (dropDown.options[i].value == "Home") {
                dropDown.options[i].selected = true;
                break;
            }
        }
    }
    if (HomePhone == '' && WorkPhone != '' && CellPhone == '') {
        for (var i = 0; i < length; i++) {
            if (dropDown.options[i].value == "Work") {
                dropDown.options[i].selected = true;
                break;
            }
        }
    }
    if (HomePhone == '' && WorkPhone == '' && CellPhone != '') {
        for (var i = 0; i < length; i++) {
            if (dropDown.options[i].value == "Cell") {
                dropDown.options[i].selected = true;
                break;
            }
        }
    }
}
function fCheckBestContact() {
    // Get values from the three text boxes and assign to variables
    var HomePhone = document.getElementById('<%= HomePhoneTextBox.ClientID %>').value;
    var WorkPhone = document.getElementById('<%= WorkPhoneTextBox.ClientID %>').value;
    var CellPhone = document.getElementById('<%= CellPhoneTextBox.ClientID %>').value;
    var dropDown = document.getElementById('<%= BestContactDropDownList.ClientID %>');
    var length = dropDown.options.length;
    // Get chosen value in combo box and assign to variable
    for (var i = 0; i < length; i++) {
        if (dropDown.options[i].selected == true) {
            var dropDownValue = dropDown.options[i].value;
            break;
        }
    }
    if (dropDownValue == 'Home' && HomePhone == '') {
        alert('No home phone number has been entered.');
        document.getElementById('<%= HomePhoneTextBox.ClientID %>').focus();
    }
    else if (dropDownValue == 'Work' && WorkPhone == '') {
        alert('No work phone number has been entered.');
        document.getElementById('<%= WorkPhoneTextBox.ClientID %>').focus();
    }
    else if (dropDownValue == 'Cell' && CellPhone == '') {
        alert('No cell phone number has been entered.');
        document.getElementById('<%= CellPhoneTextBox.ClientID %>').focus();
    }
}