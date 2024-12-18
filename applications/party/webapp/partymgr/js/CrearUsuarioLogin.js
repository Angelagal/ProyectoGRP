setTimeout(() => {
	const inputCiclo = document.getElementById('AddUserLogin_ciclo');
    const fila = inputCiclo.closest('tr');
    fila.remove();
    
    const inputExternalAuthId = document.getElementById('AddUserLogin_externalAuthId');
    const fila2 = inputExternalAuthId.closest('tr');
    fila2.remove();
}, 100);