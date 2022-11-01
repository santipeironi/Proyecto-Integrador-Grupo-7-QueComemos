const btnLanzarModal = document.querySelector('#lanzar-modal');
const btnAceptar = document.querySelector('#aceptar');
const contModal = document.querySelector('.contenedor-modal');

const usuarioImput = document.querySelector('#usuario');
const contraseñaImput = document.querySelector('#contraseña');

btnLanzarModal.addEventListener('click', (e) => {
    e.preventDefault();
    contModal.classList.add('mostrar');
});
const btnmodalRegist = document.querySelector('#modal-regist');
const btnOk = document.querySelector('#ok');
const contMod = document.querySelector('.contenedor-mod');

const nombreImput = document.querySelector('#nombre');
const dniImput = document.querySelector('#dni');
const emailImput = document.querySelector('#email');
const telefonoImput = document.querySelector('#telefono');

btnmodalRegist.addEventListener('click', (e) => {
    e.preventDefault();
    contMod.classList.add('mostrar')
});