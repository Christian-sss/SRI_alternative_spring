<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SRI - Estadísticas y Reportes</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        body { font-family: 'Inter', sans-serif; }
        ::-webkit-scrollbar { width: 6px; }
        ::-webkit-scrollbar-track { background: transparent; }
        ::-webkit-scrollbar-thumb { background: #cfe3c5; border-radius: 10px; }

        .text-gradient-green {
            background: linear-gradient(135deg, #2c5e2a, #6dae5a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        /* Ocultar elementos visualmente pero mantenerlos para accesibilidad/lógica */
        .tab-content { display: none; }
        .tab-content.active { display: block; animation: fadeIn 0.4s ease-out forwards; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }
    </style>
</head>
<body class="flex h-screen bg-[#eef3ec] text-[#1e2a1f] p-4 gap-4 overflow-hidden">

    <aside class="w-72 bg-white rounded-[2rem] flex flex-col justify-between shadow-sm border border-[#cfe3c5] relative overflow-hidden hidden md:flex">
        <div class="relative z-10">
            <div class="p-8 pb-4 flex items-center space-x-4 border-b border-[#eef3ec] mx-4 mb-4">
                <div class="text-[#589a47] text-3xl"><i class="fas fa-seedling"></i></div>
                <div>
                    <h1 class="text-2xl font-bold text-gradient-green tracking-tight">SRI</h1>
                    <p class="text-[11px] text-[#6f8f60] font-semibold">RIEGO INTELIGENTE</p>
                </div>
            </div>

            <nav class="px-6 space-y-2">
                <a href="${pageContext.request.contextPath}/dashboard" class="flex items-center space-x-4 text-[#618a52] hover:bg-[#f9fef7] hover:text-[#2c5e2a] px-5 py-4 rounded-2xl transition-all">
                    <i class="fa-solid fa-chart-line w-5"></i>
                    <span class="font-semibold">Dashboard</span>
                </a>
                <a href="${pageContext.request.contextPath}/sensores" class="flex items-center space-x-4 text-[#618a52] hover:bg-[#f9fef7] hover:text-[#2c5e2a] px-5 py-4 rounded-2xl transition-all">
                    <i class="fa-solid fa-microchip w-5"></i>
                    <span class="font-semibold">Sensores</span>
                </a>
                <a href="#" class="flex items-center space-x-4 text-[#618a52] hover:bg-[#f9fef7] hover:text-[#2c5e2a] px-5 py-4 rounded-2xl transition-all">
                    <i class="fa-solid fa-water w-5"></i>
                    <span class="font-semibold">Riego</span>
                </a>
                <a href="${pageContext.request.contextPath}/estadisticas" class="flex items-center space-x-4 bg-[#eef4ea] text-[#2c5e2a] px-5 py-4 rounded-2xl border border-[#cbe3c0] shadow-sm">
                    <i class="fa-solid fa-flag-checkered w-5"></i>
                    <span class="font-bold">Reportes</span>
                </a>
            </nav>
        </div>

        <div class="p-6">
            <div class="bg-[#f1f7ef] p-4 rounded-3xl flex items-center justify-between border border-[#d2e6c8]">
                <div class="flex items-center space-x-3">
                    <div class="bg-[#e2f0dc] text-[#2d6a2b] w-10 h-10 rounded-full flex items-center justify-center border border-[#bbddae]">
                        <i class="fa-solid fa-user-astronaut"></i>
                    </div>
                    <div>
                        <p class="text-sm font-bold text-[#2c5e2a]">Administrador</p>
                    </div>
                </div>
            </div>
        </div>
    </aside>

    <main class="flex-1 flex flex-col gap-4 overflow-hidden">

        <header class="bg-white rounded-full px-6 py-4 flex justify-between items-center shadow-sm border border-[#cfe3c5]">
            <div class="flex items-center gap-4">
                <a href="${pageContext.request.contextPath}/dashboard" class="bg-[#f1f7ef] text-[#4b6442] hover:bg-[#e2f0dc] hover:text-[#2c5e2a] w-10 h-10 rounded-full flex items-center justify-center transition-all border border-[#d2e6c8]">
                    <i class="fas fa-arrow-left"></i>
                </a>
                <h2 class="text-xl font-bold text-[#1e3a1c]">Analíticas y Reportes</h2>
            </div>

            <div class="flex items-center space-x-2">
                <span class="text-sm text-[#6f8f60] font-medium mr-2">Exportar:</span>
                <a href="/reportes/pdf" target="_blank" class="flex items-center gap-2 bg-[#fff0f0] text-[#c92a2a] hover:bg-[#ffe3e3] px-4 py-2 rounded-full text-sm font-bold border border-[#ffdada] transition-all">
                    <i class="fas fa-file-pdf"></i> <span class="hidden md:inline">PDF</span>
                </a>
                <a href="/reportes/excel" class="flex items-center gap-2 bg-[#f0fdf4] text-[#16a34a] hover:bg-[#dcfce7] px-4 py-2 rounded-full text-sm font-bold border border-[#bbf7d0] transition-all">
                    <i class="fas fa-file-excel"></i> <span class="hidden md:inline">Excel</span>
                </a>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto pb-4 pr-2">

            <div class="bg-[#fefefb] border border-[#e0eed9] rounded-3xl p-2 mb-5 flex flex-wrap gap-2 justify-between items-center shadow-sm">
                <div class="flex gap-2">
                    <button class="bg-[#d4e6cb] text-[#1e461a] border border-[#b2d3a3] px-5 py-2.5 rounded-full text-sm font-bold shadow-sm transition-all">
                        <i class="fas fa-tint mr-1"></i> Control Hídrico
                    </button>
                    <button class="bg-transparent text-[#618a52] hover:bg-[#f1f7ef] border border-transparent px-5 py-2.5 rounded-full text-sm font-semibold transition-all">
                        <i class="fas fa-bolt mr-1"></i> Consumo Energía
                    </button>
                    <button class="bg-transparent text-[#618a52] hover:bg-[#f1f7ef] border border-transparent px-5 py-2.5 rounded-full text-sm font-semibold transition-all">
                        <i class="fas fa-seedling mr-1"></i> Histórico Suelo
                    </button>
                </div>

                <div class="pr-2">
                    <select class="bg-[#f9fef7] border border-[#dcebd5] text-[#4b6442] text-sm font-semibold rounded-full focus:ring-[#8bc77b] focus:border-[#8bc77b] block w-full p-2.5 outline-none cursor-pointer">
                        <option value="7">Últimos 7 días</option>
                        <option value="30" selected>Mes Actual</option>
                        <option value="365">Año Actual</option>
                    </select>
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-5 mb-5">
                <div class="bg-white border border-[#e0eed9] rounded-[2rem] p-6 shadow-sm flex items-center gap-4">
                    <div class="w-12 h-12 rounded-full bg-[#e3f3db] text-[#4c9f3a] flex items-center justify-center text-xl"><i class="fas fa-stopwatch"></i></div>
                    <div>
                        <p class="text-sm text-[#8faa82] font-semibold">Tiempo Total Regado</p>
                        <h4 class="text-2xl font-bold text-[#1e3a1c]">14.5 <span class="text-sm font-medium text-[#6f8f60]">horas</span></h4>
                    </div>
                </div>
                <div class="bg-white border border-[#e0eed9] rounded-[2rem] p-6 shadow-sm flex items-center gap-4">
                    <div class="w-12 h-12 rounded-full bg-[#e0f0ff] text-[#226bb8] flex items-center justify-center text-xl"><i class="fas fa-water"></i></div>
                    <div>
                        <p class="text-sm text-[#8faa82] font-semibold">Agua Consumida Aprox.</p>
                        <h4 class="text-2xl font-bold text-[#1e3a1c]">850 <span class="text-sm font-medium text-[#6f8f60]">litros</span></h4>
                    </div>
                </div>
                <div class="bg-white border border-[#e0eed9] rounded-[2rem] p-6 shadow-sm flex items-center gap-4">
                    <div class="w-12 h-12 rounded-full bg-[#fcf0e3] text-[#d98c2b] flex items-center justify-center text-xl"><i class="fas fa-hand-pointer"></i></div>
                    <div>
                        <p class="text-sm text-[#8faa82] font-semibold">Intervenciones Manuales</p>
                        <h4 class="text-2xl font-bold text-[#1e3a1c]">${manuales != null ? manuales : '12'} <span class="text-sm font-medium text-[#6f8f60]">veces</span></h4>
                    </div>
                </div>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-5">

                <div class="lg:col-span-2 bg-[#fdfdf9] border border-[#dcebd5] rounded-[2rem] p-8 shadow-sm">
                    <div class="flex justify-between items-center mb-6">
                        <div>
                            <h3 class="text-lg font-bold text-[#2e6b2a]">Duración de Riego Activo</h3>
                            <p class="text-sm text-[#8faa82] font-medium">Segundos de operación de bomba por día</p>
                        </div>
                    </div>
                    <div class="relative h-[280px] w-full">
                        <canvas id="graficoBarras"></canvas>
                    </div>
                </div>

                <div class="lg:col-span-1 bg-[#fdfdf9] border border-[#dcebd5] rounded-[2rem] p-8 shadow-sm flex flex-col">
                    <div class="mb-4 text-center">
                        <h3 class="text-lg font-bold text-[#2e6b2a]">Proporción de Modos</h3>
                        <p class="text-sm text-[#8faa82] font-medium">Auto vs Manual</p>
                    </div>
                    <div class="relative flex-1 min-h-[220px] w-full flex items-center justify-center">
                        <canvas id="graficoPastel"></canvas>
                    </div>
                </div>

            </div>
        </div>
    </main>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Variables inyectadas por JSP
            const dataManuales = ${manuales != null ? manuales : 12};
            const dataAutomaticos = ${automaticos != null ? automaticos : 45};

            // Valores por defecto si JSP falla (para pruebas)
            const labelsDias = ${labelsDias != null ? labelsDias : "['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom']"};
            const datosDuracion = ${datosDuracion != null ? datosDuracion : "[1200, 950, 0, 1500, 800, 0, 2100]"};

            // Configuración Global Chart.js para que coincida con el tema
            Chart.defaults.font.family = "'Inter', sans-serif";
            Chart.defaults.color = '#79a068';

            // --- GRÁFICO 1: PASTEL (Doughnut) ---
            const ctxPastel = document.getElementById('graficoPastel').getContext('2d');
            new Chart(ctxPastel, {
                type: 'doughnut',
                data: {
                    labels: ['Riego Manual', 'Automático (IA)'],
                    datasets: [{
                        data: [dataManuales, dataAutomaticos],
                        backgroundColor: [
                            '#d98c2b', // Naranja/Tierra para manual
                            '#4c9f3a'  // Verde para automático
                        ],
                        borderWidth: 4,
                        borderColor: '#fdfdf9', // Color de fondo de la tarjeta
                        hoverOffset: 8
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    cutout: '65%', // Hace el anillo más delgado y elegante
                    plugins: {
                        legend: {
                            position: 'bottom',
                            labels: {
                                padding: 20,
                                usePointStyle: true,
                                pointStyle: 'circle',
                                font: { weight: '600' }
                            }
                        },
                        tooltip: {
                            backgroundColor: '#1e3a1c',
                            titleFont: { size: 13 },
                            bodyFont: { size: 14, weight: 'bold' },
                            padding: 12,
                            cornerRadius: 8,
                            displayColors: false
                        }
                    }
                }
            });

            // --- GRÁFICO 2: BARRAS ---
            const ctxBarras = document.getElementById('graficoBarras').getContext('2d');
            new Chart(ctxBarras, {
                type: 'bar',
                data: {
                    labels: labelsDias,
                    datasets: [{
                        label: 'Segundos de riego',
                        data: datosDuracion,
                        backgroundColor: '#8bc77b', // Verde suave
                        hoverBackgroundColor: '#4c9f3a', // Verde oscuro al pasar el ratón
                        borderRadius: 6, // Bordes redondeados en las barras
                        borderSkipped: false,
                        barPercentage: 0.6 // Hace las barras un poco más delgadas
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { display: false }, // Ocultamos leyenda porque el título ya lo explica
                        tooltip: {
                            backgroundColor: '#fbfef9',
                            titleColor: '#2e6b2a',
                            bodyColor: '#1e3a1c',
                            borderColor: '#cbe3c0',
                            borderWidth: 1,
                            padding: 10,
                            displayColors: false,
                            callbacks: {
                                label: function(context) {
                                    return context.parsed.y + ' segundos';
                                }
                            }
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            grid: {
                                color: '#dcecd4',
                                drawBorder: false,
                                lineWidth: 1
                            },
                            ticks: { font: { weight: '500' } }
                        },
                        x: {
                            grid: { display: false, drawBorder: false },
                            ticks: { font: { weight: '600' } }
                        }
                    }
                }
            });
        });
    </script>
</body>
</html>