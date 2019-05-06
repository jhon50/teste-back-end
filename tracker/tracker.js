const ENDPOINT = 'http://localhost:3000';


let lead_button = document.getElementById("lead-tracker");

if (lead_button !== null) {
    lead_button.addEventListener("click", function(){
        send_lead();
    });
}

document.addEventListener('DOMContentLoaded', function() {
    send_request();
}, false);

function send_lead() {
    var xhttp = new XMLHttpRequest();

    let name = document.getElementById("name").value;
    let email = document.getElementById("email").value;

    xhttp.open("POST", ENDPOINT + "/leads", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");// xhttp.send('name=' + name);
    xhttp.send('name=' + name + '&email=' + email);

    alert('Obrigado!');
}

function send_request() {
    // set uuid if it is null
    let uuid = localStorage.getItem('uuid');
    if(uuid === null) {
        localStorage.setItem('uuid', generate_uuid())
    }

    // terminate execution if user has not navigated
    let current_page = window.location.pathname;
    let current_page_stored = localStorage.getItem('current_page');
    if(current_page_stored === current_page && new_lead === false) {
        return;
    }
    localStorage.setItem('current_page', current_page);


    // POST page hit to tracker application
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", ENDPOINT + "/requests", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send('request_url=' + current_page + '&uuid=' + localStorage.getItem('uuid'));
}

function generate_uuid() {
    return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
        (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
    )
}