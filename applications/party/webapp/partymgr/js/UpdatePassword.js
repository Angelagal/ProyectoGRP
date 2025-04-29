// Detecta secuencias numéricas tipo 1234 o 9876
const contieneSecuenciaNumerica = (password, longitud = 4) => {
    const secuencia = '0123456789';
    const secuenciaInvertida = secuencia.split('').reverse().join('');

    for (let i = 0; i <= secuencia.length - longitud; i++) {
        const subSecuencia = secuencia.substring(i, i + longitud);
        const subSecuenciaInvertida = secuenciaInvertida.substring(i, i + longitud);

        if (password.includes(subSecuencia) || password.includes(subSecuenciaInvertida)) {
            return true;
        }
    }
    return false;
};

// Detecta secuencias alfabéticas tipo abcd o dcba
const contieneSecuenciaAlfabetica = (password, longitud = 4) => {
    const secuencia = 'abcdefghijklmnopqrstuvwxyz';
    const secuenciaInvertida = secuencia.split('').reverse().join('');

    const passwordLower = password.toLowerCase();

    for (let i = 0; i <= secuencia.length - longitud; i++) {
        const subSecuencia = secuencia.substring(i, i + longitud);
        const subSecuenciaInvertida = secuenciaInvertida.substring(i, i + longitud);

        if (passwordLower.includes(subSecuencia) || passwordLower.includes(subSecuenciaInvertida)) {
            return true;
        }
    }
    return false;
};

// Validación de contraseña
const validatePassword = (password, validarVerificacion = false, opcionesExtra = {}) => {
    const response = {
        status: true,
        mensajes: [],
    };

    const passwordLower = password.toLowerCase();

    if (password.length < 8) {
        response.status = false;
        response.mensajes.push("❌ La contraseña debe tener al menos 8 caracteres.");
    }

    if (!/\d/.test(password)) {
        response.status = false;
        response.mensajes.push("❌ La contraseña debe contener al menos un número.");
    }

    if (/(.)\1/.test(password)) {
        response.status = false;
        response.mensajes.push("❌ La contraseña no debe tener caracteres repetidos consecutivamente.");
    }

    if (!/[A-Z]/.test(password)) {
        response.status = false;
        response.mensajes.push("❌ La contraseña debe contener al menos una letra mayúscula.");
    }

    if (!/[@#$%^&*()_+!~=`{}\[\]:;"'<>,.?/-]/.test(password)) {
        response.status = false;
        response.mensajes.push("❌ La contraseña debe contener al menos un símbolo especial.");
    }

    if (contieneSecuenciaNumerica(password)) {
        response.status = false;
        response.mensajes.push("❌ La contraseña no debe contener secuencias numéricas comunes (como 1234 o 9876).");
    }

    if (contieneSecuenciaAlfabetica(password)) {
        response.status = false;
        response.mensajes.push("❌ La contraseña no debe contener secuencias alfabéticas comunes (como abcd o dcba).");
    }

    // Validación de nombre o login en contraseña
    if (opcionesExtra.nombreUsuario) {
        const nombreLower = opcionesExtra.nombreUsuario.toLowerCase();
        if (passwordLower.includes(nombreLower)) {
            response.status = false;
            response.mensajes.push("❌ La contraseña no debe contener tu nombre.");
        }
    }

    if (opcionesExtra.userLoginId) {
        const loginLower = opcionesExtra.userLoginId.toLowerCase();
        if (passwordLower.includes(loginLower)) {
            response.status = false;
            response.mensajes.push("❌ La contraseña no debe contener tu ID de usuario.");
        }
    }

    if (validarVerificacion) {
        const inputContrasena = document.getElementById("newPasswordVerify");
        const inputContrasenaValidacion = document.getElementById("newPasswordVerify");

        if (inputContrasena.value !== inputContrasenaValidacion.value) {
            response.status = false;
            response.mensajes.push("❌ La contraseña de validación debe ser igual que la contraseña original.");
        }
    }

    if (response.status) {
        response.mensajes.push("✅ Contraseña válida.");
    }

    return response;
};

// Inicializa
setTimeout(() => {
    const inputCiclo = document.getElementById('updatePassword_ciclo');
    const inputContrasena = document.getElementById("updatePassword_newPassword");
    const inputContrasenaValidacion = document.getElementById("updatePassword_newPasswordVerify");
    const inputLogin = document.getElementById("userLoginId");
    const inputNombre = document.getElementById("userName");

    const obtenerOpciones = () => ({
        userLoginId: inputLogin?.value || '',
        nombreUsuario: inputNombre?.value || '',
    });

    inputContrasena.addEventListener("change", (event) => {
        const validacion = validatePassword(event.target.value, false, obtenerOpciones());
        alert(validacion.mensajes.join("\n"));
        if (!validacion.status) event.target.value = '';
    });

    inputContrasenaValidacion.addEventListener("change", (event) => {
        const validacion = validatePassword(event.target.value, true, obtenerOpciones());
        alert(validacion.mensajes.join("\n"));
        if (!validacion.status) event.target.value = '';
    });
}, 100);
