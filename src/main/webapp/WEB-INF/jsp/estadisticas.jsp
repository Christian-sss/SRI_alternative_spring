<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Agrícola - SRI</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        /* 1. Reset básico y fondo */
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #f4f7f6;
            padding: 20px;
            margin: 0;
        }

        /* 2. Cabecera organizada (Botón Volver + Título) */
        .header-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .header-container h1 {
            color: #2c3e50;
            margin: 0;
            flex-grow: 1;
            text-align: center;
        }

        .btn-volver {
            padding: 10px 15px;
            background: #7f8c8d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background 0.3s;
        }

        .btn-volver:hover { background: #95a5a6; }

        /* 3. Botón de reporte centralizado */
        .btn-reporte {
            display: block;
            width: 220px;
            margin: 0 auto 30px auto;
            padding: 12px;
            text-align: center;
            background: #27ae60;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            box-shadow: 0 4px 6px rgba(39, 174, 96, 0.2);
            transition: transform 0.2s;
        }

        .btn-reporte:hover { transform: translateY(-2px); }

        /* 4. Contenedor de las tarjetas */
        .dashboard-container {
            display: flex;
            gap: 25px;
            justify-content: center; /* Centra las tarjetas si sobra espacio */
            flex-wrap: wrap;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            width: 45%;
            min-width: 320px; /* Evita que se aplasten en pantallas pequeñas */
            max-width: 500px; /* Evita que se estiren demasiado en pantallas gigantes */
            box-sizing: border-box;
        }

        .card h3 {
            text-align: center;
            color: #34495e;
            margin-top: 0;
            font-size: 1.1rem;
        }

        /* 5. EL TRUCO PARA EL TAMAÑO: Contenedor del gráfico */
        .chart-wrapper {
            position: relative;
            height: 280px; /* ¡Esta es la altura máxima que tendrán! */
            width: 100%;
        }
    </style>
</head>
<body>

    <div class="header-container">
        <a href="/menu" class="btn-volver">⬅ Volver</a>
        <h1>Tablero de Control Hídrico</h1>
        <div style="width: 85px;"></div>
    </div>

    <a href="/reportes/modos-riego" target="_blank" class="btn-reporte">
        📄 Descargar Reporte PDF
    </a>

    <div class="dashboard-container">
        <div class="card">
            <h3>Proporción de Riegos (Mes Actual)</h3>
            <div class="chart-wrapper">
                <canvas id="graficoPastel"></canvas>
            </div>
        </div>

        <div class="card">
            <h3>Duración de Riego (Últimos 7 días)</h3>
            <div class="chart-wrapper">
                <canvas id="graficoBarras"></canvas>
            </div>
        </div>
    </div>

    <script>
        // --- GRÁFICO 1: PASTEL (Modos de Riego) ---
        const dataManuales = ${manuales != null ? manuales : 0};
        const dataAutomaticos = ${automaticos != null ? automaticos : 0};

        const ctxPastel = document.getElementById('graficoPastel').getContext('2d');
        new Chart(ctxPastel, {
            type: 'doughnut',
            data: {
                labels: ['Riego Manual', 'Riego Automático'],
                datasets: [{
                    data: [dataManuales, dataAutomaticos],
                    backgroundColor: ['#e74c3c', '#3498db'],
                    hoverOffset: 4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false, /* CRUCIAL: Permite que respete los 280px del CSS */
                plugins: {
                    legend: { position: 'bottom' }
                }
            }
        });


        // --- GRÁFICO 2: BARRAS (Duración diaria) ---
        const labelsDias = ${labelsDias != null ? labelsDias : "[]"};
        const datosDuracion = ${datosDuracion != null ? datosDuracion : "[]"};

        const ctxBarras = document.getElementById('graficoBarras').getContext('2d');
        new Chart(ctxBarras, {
            type: 'bar',
            data: {
                labels: labelsDias,
                datasets: [{
                    label: 'Segundos de riego',
                    data: datosDuracion,
                    backgroundColor: '#2ecc71',
                    borderRadius: 5
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false, /* CRUCIAL: Permite que respete los 280px del CSS */
                scales: {
                    y: {
                        beginAtZero: true,
                        title: { display: true, text: 'Segundos' }
                    }
                }
            }
        });
    </script>

</body>
</html>