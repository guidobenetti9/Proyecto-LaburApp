        document.addEventListener('DOMContentLoaded', function() {
            const rangeInput = document.getElementById('starRange');
            const sliderValue = document.getElementById('sliderValue');

            // Inicializa el valor mostrado
            sliderValue.textContent = rangeInput.value;

            // Actualiza el valor mostrado cuando el usuario mueve el control deslizante
            rangeInput.addEventListener('input', function() {
                sliderValue.textContent = this.value;
            });
        });