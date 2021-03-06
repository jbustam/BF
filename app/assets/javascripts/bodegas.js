function addMaterialsBodegaField() {

    //create Date object
    var date = new Date();

    //get number of milliseconds since midnight Jan 1, 1970
    //and use it for material key
    var mSec = date.getTime();

    //Replace 0 with milliseconds
    idAttributdescripcion =
          "bodega_materials_attributes_0_descripcion".replace("0", mSec);
    nameAttributdescripcion =
          "bodega[materials_attributes][0][descripcion]".replace("0", mSec);

    idAttributcantidad =
          "bodega_materials_attributes_0_cantidad".replace("0", mSec);
    nameAttributcantidad =
          "bodega[materials_attributes][0][cantidad]".replace("0", mSec);

    //create <li> tag
    var li = document.createElement("li");

    //create label for descripcion, set it's for attribute,
    //and append it to <li> element
    var labeldescripcion = document.createElement("label");
    labeldescripcion.setAttribute("for", idAttributdescripcion);
    var descripcionLabelText = document.createTextNode("Descripción");
    labeldescripcion.appendChild(descripcionLabelText);
    li.appendChild(labeldescripcion);

    //create input for descripcion, set it's type, id and name attribute,
    //and append it to <li> element
    var inputdescripcion = document.createElement("INPUT");
    inputdescripcion.setAttribute("type", "text");
    inputdescripcion.setAttribute("id", idAttributdescripcion);
    inputdescripcion.setAttribute("name", nameAttributdescripcion);
    li.appendChild(inputdescripcion);

    //create label for cantidad, set it's for attribute,
    //and append it to <li> element
    var labelcantidad = document.createElement("label");
    labelcantidad.setAttribute("for", idAttributcantidad);
    var cantidadLabelText = document.createTextNode("Cantidad");
    labelcantidad.appendChild(cantidadLabelText);
    li.appendChild(labelcantidad);

    //create input for cantidad, set it's type, id and name attribute,
    //and append it to <li> element
    var inputcantidad = document.createElement("INPUT");
    inputcantidad.setAttribute("type", "text");
    inputcantidad.setAttribute("id", idAttributcantidad);
    inputcantidad.setAttribute("name", nameAttributcantidad);
    li.appendChild(inputcantidad);

    //add created <li> element with its child elements
    //(label and input) to materialesSolicitud (<ul>) element
    document.getElementById("materialesBodega").appendChild(li);

    //show material header
    $("#materialHeader").show();
}
