<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SRI - Sensores y Hardware</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

        /* Animación sutil para el pulso de conexión */
        @keyframes pulse-soft {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }
        .animate-pulse-soft { animation: pulse-soft 2s cubic-bezier(0.4, 0, 0.6, 1) infinite; }
    </style>
</head>
<body class="flex h-screen bg-[#eef3ec] text-[#1e2a1f] p-4 gap-4 overflow-hidden">

    <aside class="w-72 bg-white rounded-[2rem] flex flex-col justify-between shadow-sm border border-[#cfe3c5] relative overflow-hidden hidden md:flex">
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
                <a href="${pageContext.request.contextPath}/dashboard" class="flex items-center space-x-4 text-[#618a52] hover:bg-[#f9fef7] hover:text-[#2c5e2a] px-5 py-4 rounded-2xl transition-all">
                    <i class="fa-solid fa-chart-line w-5"></i>
                    <span class="font-semibold">Dashboard</span>
                </a>
                <a href="#" class="flex items-center space-x-4 bg-[#eef4ea] text-[#2c5e2a] px-5 py-4 rounded-2xl border border-[#cbe3c0] shadow-sm">
                    <i class="fa-solid fa-microchip w-5"></i>
                    <span class="font-bold">Sensores</span>
                </a>
                <a href="${pageContext.request.contextPath}/riego" class="flex items-center space-x-4 text-[#618a52] hover:bg-[#f9fef7] hover:text-[#2c5e2a] px-5 py-4 rounded-2xl transition-all">
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
            <div class="flex items-center gap-4">
                <div class="bg-[#e2f0dc] text-[#2d6a2b] w-10 h-10 rounded-full flex items-center justify-center border border-[#bbddae]">
                    <i class="fas fa-microchip"></i>
                </div>
                <div>
                    <h2 class="text-xl font-bold text-[#1e3a1c]">Red de Sensores y Hardware</h2>
                </div>
            </div>
            <div class="flex items-center space-x-4">
                <button class="bg-[#d4e6cb] hover:bg-[#c3ddb6] text-[#1e461a] px-5 py-2.5 rounded-full text-sm font-bold transition-all border border-[#b2d3a3] shadow-sm flex items-center gap-2">
                    <i class="fas fa-satellite-dish"></i> <span>Escanear Red</span>
                </button>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto pb-4 pr-2">

            <div class="bg-[#fdfdf9] border border-[#dcebd5] rounded-[2rem] p-6 shadow-sm mb-5 flex flex-col md:flex-row justify-between items-center gap-4">
                <div class="flex items-center gap-4">
                    <div class="relative">
                        <div class="w-14 h-14 rounded-full bg-[#1e3a1c] text-[#eef3ec] flex items-center justify-center text-2xl shadow-md z-10 relative">
                            <i class="fas fa-server"></i>
                        </div>
                        <div class="absolute top-0 right-0 w-4 h-4 bg-[#61b24d] rounded-full border-2 border-[#fdfdf9] z-20 animate-pulse-soft"></div>
                    </div>
                    <div>
                        <h3 class="text-lg font-bold text-[#2e6b2a]">Nodo Principal (ESP32)</h3>
                        <p class="text-sm text-[#8faa82] font-medium">MAC: 24:6F:28:XX:XX:XX • IP: 192.168.1.105</p>
                    </div>
                </div>
                <div class="flex gap-6 text-sm">
                    <div class="text-center">
                        <p class="text-[#8faa82] font-semibold mb-1">Señal WiFi</p>
                        <p class="font-bold text-[#1e3a1c] flex items-center justify-center gap-1"><i class="fas fa-wifi text-[#589a47]"></i> -65 dBm</p>
                    </div>
                    <div class="text-center border-l border-[#dcebd5] pl-6">
                        <p class="text-[#8faa82] font-semibold mb-1">Uptime</p>
                        <p class="font-bold text-[#1e3a1c]">14d 05h 22m</p>
                    </div>
                    <div class="text-center border-l border-[#dcebd5] pl-6">
                        <p class="text-[#8faa82] font-semibold mb-1">Protocolo</p>
                        <p class="font-bold text-[#1e3a1c]">MQTT (TCP)</p>
                    </div>
                </div>
            </div>

            <h3 class="text-md font-bold text-[#3d7136] mb-3 ml-2">Periféricos Conectados</h3>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-5 mb-5">

                <div class="bg-white border border-[#e0eed9] rounded-[2rem] p-6 shadow-sm hover:shadow-md transition-all relative overflow-hidden">
                    <div class="absolute top-0 right-0 bg-[#eef4ea] text-[#4b6442] px-4 py-1.5 rounded-bl-[1.5rem] text-xs font-bold border-l border-b border-[#dcebd5]">
                        PIN: ADC_CH4 (32)
                    </div>

                    <div class="flex items-start gap-4 mb-4 mt-2">
                        <div class="w-12 h-12 rounded-2xl bg-[#e3f3db] text-[#4c9f3a] flex items-center justify-center text-2xl border border-[#cbe3c0]">
                            <i class="fas fa-leaf"></i>
                        </div>
                        <div>
                            <h4 class="font-bold text-[#1e3a1c]">Sensor Capacitivo de Suelo</h4>
                            <p class="text-xs text-[#8faa82] font-medium">Zona 1: Cultivo Principal</p>
                        </div>
                    </div>

                    <div class="flex items-end justify-between mt-6">
                        <div>
                            <p class="text-xs text-[#8faa82] font-semibold mb-1">Lectura Mapeada</p>
                            <div class="text-3xl font-bold text-[#2e6b2a]">42<span class="text-lg text-[#6f8f60]">%</span></div>
                        </div>
                        <div class="text-right">
                            <p class="text-xs text-[#8faa82] font-semibold mb-1">Valor Raw (Analógico)</p>
                            <div class="text-lg font-mono font-bold text-[#4b6442]">1845 / 4095</div>
                        </div>
                    </div>

                    <div class="w-full bg-[#f1f7ef] rounded-full h-2.5 mt-4 border border-[#e0eed9]">
                        <div class="bg-[#589a47] h-2.5 rounded-full" style="width: 42%"></div>
                    </div>
                </div>

                <div class="bg-white border border-[#e0eed9] rounded-[2rem] p-6 shadow-sm hover:shadow-md transition-all relative overflow-hidden">
                    <div class="absolute top-0 right-0 bg-[#eef4ea] text-[#4b6442] px-4 py-1.5 rounded-bl-[1.5rem] text-xs font-bold border-l border-b border-[#dcebd5]">
                        PINS: TRIG(5) ECHO(18)
                    </div>

                    <div class="flex items-start gap-4 mb-4 mt-2">
                        <div class="w-12 h-12 rounded-2xl bg-[#e0f0ff] text-[#226bb8] flex items-center justify-center text-2xl border border-[#cce4ff]">
                            <i class="fas fa-ruler-vertical"></i>
                        </div>
                        <div>
                            <h4 class="font-bold text-[#1e3a1c]">Sensor Ultrasónico (HC-SR04)</h4>
                            <p class="text-xs text-[#8faa82] font-medium">Nivel de Tanque de Reserva</p>
                        </div>
                    </div>

                    <div class="flex items-end justify-between mt-6">
                        <div>
                            <p class="text-xs text-[#8faa82] font-semibold mb-1">Capacidad Actual</p>
                            <div class="text-3xl font-bold text-[#165a9e]">85<span class="text-lg text-[#5a8ec2]">%</span></div>
                        </div>
                        <div class="text-right">
                            <p class="text-xs text-[#8faa82] font-semibold mb-1">Distancia Medida</p>
                            <div class="text-lg font-mono font-bold text-[#4b6442]">15.4 cm</div>
                        </div>
                    </div>

                    <div class="w-full bg-[#f1f7ef] rounded-full h-2.5 mt-4 border border-[#e0eed9] flex flex-col justify-end">
                        <div class="bg-[#3498db] h-2.5 rounded-full" style="width: 85%"></div>
                    </div>
                </div>

            </div>

            <div class="bg-[#fbfef9] border border-[#daecd1] rounded-[2rem] p-6 shadow-sm overflow-hidden">
                <div class="flex justify-between items-center mb-4">
                    <h4 class="text-[#3d7136] font-bold flex items-center gap-2">
                        <i class="fas fa-terminal"></i> Diagnóstico y Lecturas Raw
                    </h4>
                    <span class="text-xs font-bold bg-[#eef4ea] text-[#4b6442] px-3 py-1 rounded-full border border-[#dcebd5]">Últimas 5 tramas</span>
                </div>

                <div class="overflow-x-auto">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr class="text-xs text-[#8faa82] border-b border-[#dcebd5]">
                                <th class="pb-2 font-semibold">Timestamp</th>
                                <th class="pb-2 font-semibold">Tópico MQTT</th>
                                <th class="pb-2 font-semibold">Sensor</th>
                                <th class="pb-2 font-semibold">Valor Raw</th>
                                <th class="pb-2 font-semibold text-right">Estado</th>
                            </tr>
                        </thead>
                        <tbody class="text-sm font-mono text-[#4b6442]">
                            <tr class="border-b border-[#eef3ec] hover:bg-[#f1f7ef] transition-colors">
                                <td class="py-3">10:45:32.104</td>
                                <td class="py-3">sri/nodo1/humedad</td>
                                <td class="py-3">Capacitivo A0</td>
                                <td class="py-3">1845</td>
                                <td class="py-3 text-right"><span class="text-[#589a47] font-sans font-bold text-xs"><i class="fas fa-check-circle"></i> OK</span></td>
                            </tr>
                            <tr class="border-b border-[#eef3ec] hover:bg-[#f1f7ef] transition-colors">
                                <td class="py-3">10:45:31.850</td>
                                <td class="py-3">sri/nodo1/distancia</td>
                                <td class="py-3">HC-SR04</td>
                                <td class="py-3">15.42 cm</td>
                                <td class="py-3 text-right"><span class="text-[#589a47] font-sans font-bold text-xs"><i class="fas fa-check-circle"></i> OK</span></td>
                            </tr>
                            <tr class="border-b border-[#eef3ec] hover:bg-[#f1f7ef] transition-colors">
                                <td class="py-3">10:45:29.102</td>
                                <td class="py-3">sri/nodo1/humedad</td>
                                <td class="py-3">Capacitivo A0</td>
                                <td class="py-3">1848</td>
                                <td class="py-3 text-right"><span class="text-[#589a47] font-sans font-bold text-xs"><i class="fas fa-check-circle"></i> OK</span></td>
                            </tr>
                            <tr class="border-b border-[#eef3ec] hover:bg-[#f1f7ef] transition-colors">
                                <td class="py-3">10:45:28.845</td>
                                <td class="py-3">sri/nodo1/distancia</td>
                                <td class="py-3">HC-SR04</td>
                                <td class="py-3">15.40 cm</td>
                                <td class="py-3 text-right"><span class="text-[#589a47] font-sans font-bold text-xs"><i class="fas fa-check-circle"></i> OK</span></td>
                            </tr>
                            <tr class="hover:bg-[#f1f7ef] transition-colors">
                                <td class="py-3 text-[#d98c2b]">10:45:25.001</td>
                                <td class="py-3 text-[#d98c2b]">sri/nodo1/bomba</td>
                                <td class="py-3 text-[#d98c2b]">Relé D1</td>
                                <td class="py-3 text-[#d98c2b]">STATE: HIGH</td>
                                <td class="py-3 text-right"><span class="text-[#d98c2b] font-sans font-bold text-xs"><i class="fas fa-bolt"></i> ACTIVO</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </main>

</body>
</html>

    <h1>Datos ESP32</h1>

    <div class="dato">

        Humedad:
        <strong>${humedad} %</strong>

    </div>

    <div class="dato">

        Distancia:
        <strong>${distancia} cm</strong>

    </div>
