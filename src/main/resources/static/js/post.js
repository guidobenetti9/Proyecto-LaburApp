const $d = document;
const $selectProvincias = $d.getElementById("selectProvincias");
const $selectMunicipios = $d.getElementById("selectMunicipios");
const $selectLocalidades = $d.getElementById("selectLocalidades");
const $inputLatitud = $d.getElementById("latitud");
const $inputLongitud = $d.getElementById("longitud");
const $inputNombreLocalidad = $d.getElementById("nombreLocalidad");
const $inputNombreMunicipio = $d.getElementById("nombreMunicipio");

function provincia() {
    fetch("https://apis.datos.gob.ar/georef/api/provincias")
    .then(res => res.ok ? res.json() : Promise.reject(res))
    .then(json => {
        let $options = `<option value="">Elige una provincia</option>`;
        json.provincias.forEach(el => $options += `<option value="${el.nombre}">${el.nombre}</option>`);
        $selectProvincias.innerHTML = $options;
    })
    .catch(error => {
        let message = error.statusText || "Ocurrió un error";
        console.error(`Error: ${error.status}: ${message}`);
    });
}

$d.addEventListener("DOMContentLoaded", provincia);

function municipio(provincia) {
    fetch(`https://apis.datos.gob.ar/georef/api/municipios?provincia=${provincia}&max=1000`)
    .then(res => res.ok ? res.json() : Promise.reject(res))
    .then(json => {
        let $options = `<option value="">Elige un municipio</option>`;
        json.municipios.forEach(el => $options += `<option value="${el.nombre}">${el.nombre}</option>`);
        $selectMunicipios.innerHTML = $options;
    })
    .catch(error => {
        let message = error.statusText || "Ocurrió un error";
        console.error(`Error: ${error.status}: ${message}`);
    });
}

$selectProvincias.addEventListener("change", e => {
    municipio(e.target.value);
});

function localidad(municipio) {
    fetch(`https://apis.datos.gob.ar/georef/api/localidades?municipio=${municipio}&max=1000`)
    .then(res => res.ok ? res.json() : Promise.reject(res))
    .then(json => {
        let $options = `<option value="">Elige una localidad</option>`;
        json.localidades.forEach(el => $options += `<option value="${el.nombre}" data-lat="${el.centroide.lat}" data-lon="${el.centroide.lon}">${el.nombre}</option>`);
        $selectLocalidades.innerHTML = $options;
    })
    .catch(error => {
        let message = error.statusText || "Ocurrió un error";
        console.error(`Error: ${error.status}: ${message}`);
    });
}

$selectMunicipios.addEventListener("change", e => {
    localidad(e.target.value);
});

$selectLocalidades.addEventListener("change", e => {
    let localidadSeleccionada = e.target.options[e.target.selectedIndex];
    let nombreLocalidad = localidadSeleccionada.value;
    let latitud = localidadSeleccionada.getAttribute("data-lat");
    let longitud = localidadSeleccionada.getAttribute("data-lon");
    $inputLatitud.value = latitud;
    $inputLongitud.value = longitud;
    $inputNombreLocalidad.value = nombreLocalidad;
    console.log(nombreLocalidad);
});

$selectMunicipios.addEventListener("change", e => {
    let municipioSeleccionado = e.target.value;
    $inputNombreMunicipio.value = municipioSeleccionado;
    console.log(municipioSeleccionado);
});