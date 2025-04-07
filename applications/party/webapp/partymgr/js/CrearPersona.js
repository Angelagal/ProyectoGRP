setTimeout(() => {
	document.getElementsByName("partyId")[0].required = true;
	document.getElementsByName("employeeNum")[0].required = true;
	document.getElementsByName("firstName")[0].required = true;
	document.getElementsByName("lastName")[0].required = true;
	document.getElementsByName("geografica")[0].required = true;

	const inputName = document.getElementById("EditPerson_firstName");
	const inputLastName = document.getElementById("EditPerson_lastName");

	inputName.addEventListener('keydown', (event) => {
		if (!validarInputText(event)) {
			event.preventDefault();
		}
	});

	inputLastName.addEventListener('keydown', (event) => {
		if (!validarInputText(event)) {
			event.preventDefault();
		}
	});
	
	const validarInputText = (event) => {
		const regex = /^[A-Za-z\s]+$/;
	
		// Permitir teclas especiales como Backspace, Delete, Arrow keys, Tab, Enter
		if (["Backspace", "Delete", "ArrowLeft", "ArrowRight", "Tab", "Enter"].includes(event.key)) {
			return true;
		}
	
		// Si la tecla presionada no es una letra o un espacio, bloquear la entrada
		return regex.test(event.key);
	};
}, 500);