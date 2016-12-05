function zaloguj() {
    var log = document.getElementById("username").value;
    var pas = document.getElementById("password").value;
    post("http://localhost:1337/api/v1/sessions",{username:log, password:pas});
    window.location ="home.html";
    document.cookie = "username="+log+";";
}

//post("http://localhost:1337/api/v1/collections/books", {title:"yolo", author:"fsd", description:"sgf", table_of_contents:"dfgd", cover:"gfdg", price:12, is_available:true})


function register() {
    var log = document.getElementById("username").value;
    var pas = document.getElementById("password").value;
    post("http://localhost:1337/api/v1/users",{username:log, password:pas, role:"client"});
    window.location ="login.html";
}
function post(path, params, method) {
    method = method || "post"; // Set method to post by default if not specified.

    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);

    for(var key in params) {
        if(params.hasOwnProperty(key)) {
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", key);
            hiddenField.setAttribute("value", params[key]);

            form.appendChild(hiddenField);
        }
    }

    document.body.appendChild(form);
    form.submit();
}
