function addMaterialsProveedorField() {

    //create Date object
    var date = new Date();

    //get number of milliseconds since midnight Jan 1, 1970
    //and use it for material key
    var mSec = date.getTime();

    //Replace 0 with milliseconds
    idAttributdescripcion =
          "proveedor_materials_attributes_0_descripcion".replace("0", mSec);
    nameAttributdescripcion =
          "proveedor[materials_attributes][0][descripcion]".replace("0", mSec);

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


    //add created <li> element with its child elements
    //(label and input) to materialesSolicitud (<ul>) element
    document.getElementById("materialesProveedor").appendChild(li);

    //show material header
    $("#materialHeader").show();
}
