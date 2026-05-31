<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SRI - Riego Inteligente</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        body { font-family: 'Inter', sans-serif; }
        ::-webkit-scrollbar { width: 6px; }
        ::-webkit-scrollbar-track { background: transparent; }
        ::-webkit-scrollbar-thumb { background: #cfe3c5; border-radius: 10px; }

        /* Clase personalizada para el texto con gradiente de tu diseño */
        .text-gradient-green {
            background: linear-gradient(135deg, #2c5e2a, #6dae5a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
    </style>
</head>
<body class="flex h-screen bg-[#eef3ec] text-[#1e2a1f] p-4 gap-4 overflow-hidden">

    <aside class="w-72 bg-white rounded-[2rem] flex flex-col justify-between shadow-sm border border-[#cfe3c5] relative overflow-hidden">

        <div class="relative z-10">
            <div class="p-8 pb-4 flex items-center space-x-4 border-b border-[#eef3ec] mx-4 mb-4">
                <div class="text-[#589a47] text-3xl">
                    <i class="fas fa-seedling"></i>
                </div>
                <div>
                    <h1 class="text-2xl font-bold text-gradient-green tracking-tight">SRI</h1>
                    <p class="text-[11px] text-[#6f8f60] font-semibold">RIEGO INTELIGENTE</p>
                </div>
            </div>

            <nav class="px-6 space-y-2">
                <a href="#" class="flex items-center space-x-4 bg-[#eef4ea] text-[#2c5e2a] px-5 py-4 rounded-2xl border border-[#cbe3c0] shadow-sm">
                    <i class="fa-solid fa-chart-line w-5"></i>
                    <span class="font-bold">Dashboard</span>
                </a>
                <a href="${pageContext.request.contextPath}/sensores" class="flex items-center space-x-4 text-[#618a52] hover:bg-[#f9fef7] hover:text-[#2c5e2a] px-5 py-4 rounded-2xl transition-all">
                    <i class="fa-solid fa-microchip w-5"></i>
                    <span class="font-semibold">Sensores</span>
                </a>


                <a href="#" class="flex items-center space-x-4 text-[#618a52] hover:bg-[#f9fef7] hover:text-[#2c5e2a] px-5 py-4 rounded-2xl transition-all">
                    <i class="fa-solid fa-water w-5"></i>
                    <span class="font-semibold">Riego</span>
                </a>
                <a href="${pageContext.request.contextPath}/estadisticas" class="flex items-center space-x-4 text-[#618a52] hover:bg-[#f9fef7] hover:text-[#2c5e2a] px-5 py-4 rounded-2xl transition-all">
                    <i class="fa-solid fa-flag-checkered w-5"></i>
                    <span class="font-semibold">Reportes</span>
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
                        <p class="text-sm font-bold text-[#2c5e2a]">${usuarioNombre != null ? usuarioNombre : 'Christian'}</p>
                        <p class="text-xs text-[#6f8f60] font-medium">Administrador</p>
                    </div>
                </div>
            </div>
        </div>
    </aside>

    <main class="flex-1 flex flex-col gap-4 overflow-hidden">

        <header class="bg-white rounded-full px-8 py-4 flex justify-between items-center shadow-sm border border-[#cfe3c5]">
            <div>
                <h2 class="text-xl font-bold text-[#1e3a1c]">Monitoreo y control ambiental</h2>
            </div>
            <div class="flex items-center space-x-4">
                <div class="hidden md:flex items-center space-x-2 bg-[#e2f0dc] text-[#2d6a2b] px-4 py-2 rounded-full text-sm font-bold border border-[#bbddae]">
                    <i class="fas fa-cloud-upload-alt"></i>
                    <span>MQTT Conectado</span>
                </div>
                <div class="flex items-center space-x-3 text-[#4b6442] bg-[#f9fef7] px-5 py-2.5 rounded-full border border-[#e0eed9] font-medium">
                    <i class="fa-regular fa-clock text-[#589a47]"></i>
                    <span class="text-sm">${fechaActual != null ? fechaActual : '10:45:32'}</span>
                </div>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto pb-4 pr-2">

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-5 mb-5">

                <div class="bg-[#fefefb] border border-[#e0eed9] rounded-[2rem] p-6 shadow-sm hover:shadow-md transition-shadow">
                    <div class="text-[#3c9240] text-3xl mb-3"><i class="fas fa-tachometer-alt"></i></div>
                    <h3 class="text-sm font-semibold text-[#4b6442] mb-2">Humedad del suelo</h3>
                    <div class="text-4xl font-bold text-[#1e3a1c] mb-1">${humedadActual != null ? humedadActual : '42'}<span class="text-2xl">%</span></div>
                    <div class="text-sm text-[#8faa82] font-medium">Nivel Óptimo</div>
                </div>

                <div class="bg-[#fefefb] border border-[#e0eed9] rounded-[2rem] p-6 shadow-sm hover:shadow-md transition-shadow">
                    <div class="text-[#4791b5] text-3xl mb-3"><i class="fas fa-water"></i></div>
                    <h3 class="text-sm font-semibold text-[#4b6442] mb-2">Agua disponible</h3>
                    <div class="text-2xl font-bold text-[#1e3a1c] mb-1 flex items-center gap-2">
                        <i class="fas fa-check-circle text-[#529a45]"></i> Adecuado
                    </div>
                    <div class="text-sm text-[#8faa82] font-medium">Nivel suficiente</div>
                </div>

                <div class="bg-[#fefefb] border border-[#e0eed9] rounded-[2rem] p-6 shadow-sm hover:shadow-md transition-shadow">
                    <div class="text-[#d98c2b] text-3xl mb-3"><i class="fas fa-pump-water"></i></div>
                    <h3 class="text-sm font-semibold text-[#4b6442] mb-2">Estado Bomba</h3>
                    <div class="mb-1">
                        <span class="inline-block bg-[#d9efce] text-[#2d6a2b] px-4 py-1 rounded-full text-sm font-bold border border-[#bbddae]">Encendida</span>
                    </div>
                    <div class="text-sm text-[#8faa82] font-medium mt-2">Funcionando riego activo</div>
                </div>

                <div class="bg-[#fefefb] border border-[#e0eed9] rounded-[2rem] p-6 shadow-sm hover:shadow-md transition-shadow">
                    <div class="text-[#6f42c1] text-3xl mb-3"><i class="fas fa-robot"></i></div>
                    <h3 class="text-sm font-semibold text-[#4b6442] mb-2">Modo Operación</h3>
                    <div class="mb-1">
                        <span class="inline-block bg-[#eef4ea] text-[#4b6442] px-4 py-1 rounded-full text-sm font-bold border border-[#dcebd5]">Automático</span>
                    </div>
                    <div class="text-sm text-[#8faa82] font-medium mt-2">Riego según humedad</div>
                </div>

            </div>

            <div class="bg-[#fdfdf9] border border-[#dcebd5] rounded-[2rem] p-8 shadow-sm mb-5">
                <div class="flex justify-between items-center mb-6">
                    <h3 class="text-lg font-bold text-[#2e6b2a] flex items-center gap-2">
                        <i class="fas fa-chart-line text-[#4c9f3a]"></i> Historial de humedad
                    </h3>
                    <div class="text-xs bg-[#eaf4e5] text-[#578a48] px-4 py-1.5 rounded-full font-semibold border border-[#dcebd5]">
                        <i class="fas fa-sync-alt mr-1"></i> Actualización cada 3s
                    </div>
                </div>
                <div class="h-[260px] w-full">
                    <canvas id="humedadChart"></canvas>
                </div>
                <div class="text-xs text-center mt-4 text-[#79a068] font-medium">Evolución reciente de las lecturas del sensor capacitivo (%)</div>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-5">

                <div class="lg:col-span-2 bg-[#fbfef9] border border-[#daecd1] rounded-[2rem] p-8 shadow-sm">
                    <h4 class="text-[#3d7136] font-bold mb-6 flex items-center gap-2">
                        <i class="fas fa-gamepad"></i> Control Manual
                    </h4>
                    <div class="flex flex-wrap gap-3">
                        <button class="bg-[#ecf6e8] border border-[#cbe3c0] text-[#2a5e25] font-semibold py-2.5 px-5 rounded-full hover:bg-[#dcebd4] hover:border-[#9bc388] transition-all active:scale-95 shadow-sm">
                            <i class="fas fa-play mr-1"></i> Encender Bomba
                        </button>
                        <button class="bg-[#fff0f0] border border-[#ffdada] text-[#c92a2a] font-semibold py-2.5 px-5 rounded-full hover:bg-[#ffe3e3] hover:border-[#ffc9c9] transition-all active:scale-95 shadow-sm">
                            <i class="fas fa-stop mr-1"></i> Apagar Bomba
                        </button>
                        <button class="bg-[#ecf6e8] border border-[#cbe3c0] text-[#2a5e25] font-semibold py-2.5 px-5 rounded-full hover:bg-[#dcebd4] hover:border-[#9bc388] transition-all active:scale-95 shadow-sm">
                            <i class="fas fa-leaf mr-1"></i> Iniciar Riego
                        </button>
                        <button class="bg-[#f0f7ff] border border-[#d6eaff] text-[#226bb8] font-semibold py-2.5 px-5 rounded-full hover:bg-[#e0f0ff] hover:border-[#bbddff] transition-all active:scale-95 shadow-sm">
                            <i class="fas fa-pause mr-1"></i> Detener Riego
                        </button>
                        <button class="bg-[#d4e6cb] border border-[#b2d3a3] text-[#1e461a] font-bold py-2.5 px-5 rounded-full hover:bg-[#c3ddb6] transition-all active:scale-95 shadow-sm ml-auto">
                            <i class="fas fa-sync-alt mr-1"></i> Modo Automático
                        </button>
                    </div>
                    <p class="text-xs text-[#85a777] mt-5 flex items-start gap-2">
                        <i class="fas fa-info-circle mt-0.5"></i>
                        <span>Manual: fuerza estado de bomba. Automático: riego según humedad (<35% enciende, >60% apaga).</span>
                    </p>
                </div>

                <div class="bg-[#fbfef9] border border-[#daecd1] rounded-[2rem] p-8 shadow-sm">
                    <h4 class="text-[#3c7536] font-bold mb-6 flex items-center gap-2">
                        <i class="fas fa-microchip"></i> Sistema operando
                    </h4>
                    <div class="space-y-4 text-sm text-[#496a3e]">
                        <div class="flex items-center gap-3">
                            <div class="w-2.5 h-2.5 bg-[#61b24d] rounded-full shadow-[0_0_0_2px_#c1e0b5]"></div>
                            <span><strong>ESP32:</strong> Conectado</span>
                        </div>
                        <div class="flex items-center gap-3">
                            <i class="fas fa-network-wired text-[#589a47] w-2.5 text-center"></i>
                            <span><strong>MQTT:</strong> Activo</span>
                        </div>
                        <div class="flex items-center gap-3">
                            <i class="fas fa-clock text-[#589a47] w-2.5 text-center"></i>
                            <span><strong>Última lectura:</strong> 10:45:32</span>
                        </div>
                    </div>
                    <hr class="border-t border-[#dcf0d3] my-5">
                    <div class="flex items-center gap-3 text-sm text-[#496a3e]">
                        <i class="fas fa-tint text-[#4791b5] w-2.5 text-center"></i>
                        <span>Modo actual: <strong>Automático</strong></span>
                    </div>
                </div>

            </div>

            <div class="text-center text-xs text-[#8fae80] font-medium mt-6 mb-2">
                <i class="fas fa-cloud-sun mr-1"></i> Sistema de Riego Inteligente | Interfaz fusionada
            </div>

        </div>
    </main>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            Chart.defaults.font.family = "'Inter', sans-serif";
            Chart.defaults.color = '#79a068';

            const ctx = document.getElementById('humedadChart').getContext('2d');

            // Gradiente verde pálido (#e3f3db) de tu diseño
            let gradient = ctx.createLinearGradient(0, 0, 0, 260);
            gradient.addColorStop(0, 'rgba(227, 243, 219, 1)');
            gradient.addColorStop(1, 'rgba(227, 243, 219, 0)');

            const dataPoints = [40, 45, 52, 60, 67, 73, 66, 68, 62, 60, 54, 52, 45, 42, 35, 32, 27, 29, 25, 26, 24, 27, 26, 30, 32, 36, 34, 38, 40];
            const labels = ['10:00', '', '12:00', '', '14:00', '', '16:00', '', '18:00', '', '20:00', '', '22:00', '', '00:00', '', '02:00', '', '04:00', '', '06:00', '', '08:00', '', '10:00'];

            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Humedad',
                        data: dataPoints,
                        borderColor: '#4c9f3a', // El verde del borde de tu canvas
                        backgroundColor: gradient,
                        borderWidth: 2.5,
                        pointBackgroundColor: '#ffffff',
                        pointBorderColor: '#2b7522', // Puntos destacados de tu diseño
                        pointBorderWidth: 2,
                        pointRadius: 3,
                        pointHoverRadius: 6,
                        fill: true,
                        tension: 0.3 // Ligera curvatura
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { display: false },
                        tooltip: {
                            backgroundColor: '#fbfef9',
                            titleColor: '#2e6b2a',
                            bodyColor: '#1e3a1c',
                            borderColor: '#cbe3c0',
                            borderWidth: 1,
                            padding: 10,
                            displayColors: false,
                            callbacks: {
                                label: function(context) { return context.parsed.y + '%'; }
                            }
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            max: 100,
                            ticks: { stepSize: 20 },
                            border: { display: false },
                            grid: { color: '#dcecd4', lineWidth: 0.8 } // Grid sutil de tu canvas
                        },
                        x: {
                            ticks: { maxTicksLimit: 10 },
                            border: { display: false },
                            grid: { display: false }
                        }
                    }
                }
            });
        });
    </script>
</body>
</html>