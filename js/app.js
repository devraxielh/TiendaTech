const url = new URL(window.location.href);
const tema = url.searchParams.get('tema');
const header = document.getElementById("header");
if(tema == '0'){
    header.style.backgroundColor = "#009fff";
}
if(tema == '1'){
    header.style.backgroundColor = "#ff006a";
}
if(tema == '2'){
    header.style.backgroundColor = "#ff9500";
}

//elemento.classList.add("clase1", "clase2"); // Añade varias clases
//elemento.classList.remove("clase1"); // Elimina una clase