function addbook() {
    var tit = document.getElementById("title").value;
    var aut = document.getElementById("author").value;
    var desc = document.getElementById("description").value;
    var tab = document.getElementById("table_of_contents").value;
    var cov = document.getElementById("cover").value;
    var pri = document.getElementById("price").value;
    var av = document.getElementById("is_available").value;
    post("http://localhost:1337/api/v1/collections/books",
         {title:tit,
          author:aut,
          description:desc,
          table_of_contents:tab,
          cover:cov,
          price:pri,
          is_available:av});

    window.location ="home.html";
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
