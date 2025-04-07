const validatePassword = (password, validarVerificacion = false) => {
    const response = {
        status: true,
        mensajes: [],
    };
    
    // Mínimo 8 caracteres
    if (password.length < 8) {
        response.status = false;
        response.mensajes.push("❌ La contraseña debe tener al menos 8 caracteres.");
    }

    // Debe contener al menos un número
    if (!/\d/.test(password)) {
        response.status = false;
        response.mensajes.push("❌ La contraseña debe contener al menos un número.");
    }

    // No debe tener caracteres repetidos consecutivamente
    if (/(.)\1/.test(password)) {
        response.status = false;
        response.mensajes.push("❌ La contraseña no debe tener caracteres repetidos consecutivamente.");
    }

    // Debe contener al menos una mayúscula
    if (!/[A-Z]/.test(password)) {
        response.status = false;
        response.mensajes.push("❌ La contraseña debe contener al menos una letra mayúscula.");
    }

    // Debe contener al menos un símbolo especial
    if (!/[@#$%^&*()_+!~=`{}\[\]:;"'<>,.?/-]/.test(password)) {
        response.status = false;
        response.mensajes.push("❌ La contraseña debe contener al menos un símbolo especial.");
    }

    if (validarVerificacion) {
        const inputContrasena = document.getElementById("AddUserLogin_currentPassword");
        const inputContrasenaValidacion = document.getElementById("AddUserLogin_currentPasswordVerify");

        // Validación de ambas contraseñas para que sean iguales
        if (inputContrasena.value !== inputContrasenaValidacion.value) {
            response.status = false;
            response.mensajes.push("❌ La contraseña de validación debe ser igual que la contraseña original.");
        }
    }

    if (response.status) {
        response.mensajes.push("✅ Contraseña válida.");
    }

    return response;
}

const searchParty = async () => {
    try {
        const url = new URL(window.location.href);
        const params = new URLSearchParams(url.search);
        const partyId = params.get("partyId");

        const response = await fetch(`http://localhost:3000/parties/${partyId}`);
        const data = await response.json();
        const firstName = data.person.first_name;
        const lastName = data.person.last_name;
        const firstNameCaracter = firstName.substring(0, 1);
        const lastNameCaracter = lastName.substring(0,1);

        let codigoInicioSesionUsuario = `USU${data.employee_num}${firstNameCaracter}${lastNameCaracter}`;
        const inputRUSP = document.getElementById("AddUserLogin_userLoginId");
        inputRUSP.value = codigoInicioSesionUsuario;
        inputRUSP.readOnly = true;
        inputRUSP.style.background = "rgba(0,0,0,0.1)";
    } catch (error) {
        console.error(error);
    }
};

setTimeout(() => {
    searchParty();

    const inputCiclo = document.getElementById('AddUserLogin_ciclo');
    const fila = inputCiclo.closest('tr');
    fila.remove();

    const inputExternalAuthId = document.getElementById('AddUserLogin_externalAuthId');
    const fila2 = inputExternalAuthId.closest('tr');
    fila2.remove();

    const inputContrasena = document.getElementById("AddUserLogin_currentPassword");
    const inputContrasenaValidacion = document.getElementById("AddUserLogin_currentPasswordVerify");

    inputContrasena.addEventListener("change", (event) => {
        const validacion = validatePassword(event.target.value);
        alert(validacion.mensajes);

        if (!validacion.status) {
            event.target.value = '';
        }
    });

    inputContrasenaValidacion.addEventListener("change", (event) => {
        const validacion = validatePassword(event.target.value, true);
        alert(validacion.mensajes);

        if (!validacion.status) {
            event.target.value = '';
        }
    });
}, 100);