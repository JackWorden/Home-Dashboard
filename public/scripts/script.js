function updateDateTime() {
    var time = new Date().toLocaleTimeString(navigator.language, { hour: 'numeric', minute: '2-digit'});
    $('.time').text(time.toLowerCase().replace(' ', ''));
    $('.date').text(new Date().toLocaleDateString().split('/').join('.'));

    setTimeout("updateDateTime()", 10000);
}

updateDateTime();