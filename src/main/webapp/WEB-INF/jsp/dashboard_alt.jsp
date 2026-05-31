<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SRI Sistema de Riego Inteligente</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,400;14..32,500;14..32,600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: #eef3ec;  /* fondo ligeramente verdoso */
            font-family: 'Inter', sans-serif;
            padding: 2rem;
            color: #1e2a1f;
        }

        .dashboard {
            max-width: 1280px;
            margin: 0 auto;
            background: #ffffff;
            border-radius: 28px;
            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.05);
            padding: 1.8rem 2rem;
            transition: all 0.2s;
        }

        /* Header con más color */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #cfe3c5;
            background: linear-gradient(95deg, #ffffff 0%, #f9fef7 100%);
            border-radius: 20px 20px 0 0;
        }
        .title h1 {
            font-size: 1.9rem;
            font-weight: 700;
            background: linear-gradient(135deg, #2c5e2a, #6dae5a);
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            letter-spacing: -0.3px;
        }
        .title p {
            font-size: 0.85rem;
            color: #6f8f60;
            margin-top: 5px;
            font-weight: 500;
        }
        .status-badge {
            background: #e2f0dc;
            padding: 0.5rem 1.2rem;
            border-radius: 40px;
            font-size: 0.8rem;
            font-weight: 600;
            color: #2d6a2b;
            border: 1px solid #bbddae;
        }
        .admin-badge {
            background: #f1f7ef;
            padding: 0.5rem 1.2rem;
            border-radius: 40px;
            font-size: 0.8rem;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            border: 1px solid #d2e6c8;
            color: #4c7c3f;
        }

        /* Navegación */
        .nav {
            display: flex;
            gap: 2rem;
            margin-bottom: 2rem;
            border-bottom: 1px solid #deecda;
            padding-bottom: 0.6rem;
        }
        .nav span {
            font-size: 0.9rem;
            font-weight: 600;
            color: #618a52;
            cursor: default;
            padding: 0.2rem 0;
        }
        .nav span:first-child {
            color: #2c5e2a;
            border-bottom: 3px solid #8bc77b;
            padding-bottom: 0.6rem;
            margin-bottom: -0.6rem;
        }

        /* Grid de tarjetas más coloridas */
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(210px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2.5rem;
        }
        .card {
            background: #fefefb;
            border: 1px solid #e0eed9;
            border-radius: 24px;
            padding: 1.2rem 1rem;
            transition: all 0.2s ease;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }
        .card:nth-child(1) .card-icon { color: #3c9240; }
        .card:nth-child(2) .card-icon { color: #4791b5; }
        .card:nth-child(3) .card-icon { color: #d98c2b; }
        .card:nth-child(4) .card-icon { color: #6f42c1; }
        .card-icon {
            font-size: 2rem;
            margin-bottom: 0.8rem;
        }
        .card h3 {
            font-size: 0.85rem;
            font-weight: 600;
            color: #4b6442;
            letter-spacing: 0.3px;
            margin-bottom: 0.5rem;
        }
        .card-value {
            font-size: 2rem;
            font-weight: 700;
            color: #1e3a1c;
            margin: 0.4rem 0 0.2rem;
        }
        .card-sub {
            font-size: 0.7rem;
            color: #8faa82;
            font-weight: 500;
        }
        .tag {
            display: inline-block;
            background: #eef4ea;
            padding: 0.25rem 0.9rem;
            border-radius: 24px;
            font-size: 0.7rem;
            font-weight: 600;
        }

        /* Panel del gráfico con área sombreada */
        .chart-panel {
            background: #fdfdf9;
            border: 1px solid #dcebd5;
            border-radius: 24px;
            padding: 1rem 1rem 0.8rem;
            margin: 1.8rem 0 2rem;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.02);
        }
        .chart-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
            flex-wrap: wrap;
        }
        .chart-header h3 {
            font-size: 1rem;
            font-weight: 700;
            color: #2e6b2a;
        }
        .refresh-note {
            font-size: 0.7rem;
            background: #eaf4e5;
            padding: 0.3rem 1rem;
            border-radius: 40px;
            color: #578a48;
            font-weight: 500;
        }
        canvas {
            width: 100%;
            height: auto;
            background: #ffffff;
            border-radius: 18px;
            margin-top: 0.2rem;
        }

        /* Controles más vibrantes */
        .controls-section {
            display: flex;
            flex-wrap: wrap;
            gap: 1.8rem;
            justify-content: space-between;
            margin-top: 0.5rem;
        }
        .buttons-panel {
            background: #fbfef9;
            border: 1px solid #daecd1;
            border-radius: 24px;
            padding: 1rem 1.2rem;
            flex: 2;
            min-width: 240px;
        }
        .buttons-panel h4 {
            font-size: 0.9rem;
            font-weight: 700;
            margin-bottom: 1rem;
            color: #3d7136;
        }
        .btn {
            background: #ecf6e8;
            border: 1px solid #cbe3c0;
            font-family: inherit;
            font-weight: 600;
            font-size: 0.8rem;
            padding: 0.5rem 1rem;
            margin: 0.25rem 0.4rem;
            border-radius: 40px;
            color: #2a5e25;
            cursor: pointer;
            transition: all 0.15s;
        }
        .btn:hover {
            background: #dcebd4;
            border-color: #9bc388;
            transform: translateY(-1px);
        }
        .btn:active {
            transform: scale(0.96);
        }
        .status-panel {
            background: #fbfef9;
            border: 1px solid #daecd1;
            border-radius: 24px;
            padding: 1rem 1.2rem;
            flex: 1.2;
            min-width: 220px;
        }
        .status-panel p {
            font-size: 0.8rem;
            margin: 0.7rem 0;
            display: flex;
            align-items: center;
            gap: 10px;
            color: #496a3e;
        }
        .dot-green {
            width: 10px;
            height: 10px;
            background: #61b24d;
            border-radius: 50%;
            display: inline-block;
            box-shadow: 0 0 0 1px #c1e0b5;
        }
        hr {
            margin: 1rem 0 0;
            border: none;
            border-top: 1px solid #dcf0d3;
        }
        .footer {
            margin-top: 2rem;
            text-align: center;
            font-size: 0.7rem;
            color: #8fae80;
            font-weight: 500;
        }
        @media (max-width: 680px) {
            body { padding: 1rem; }
            .dashboard { padding: 1.2rem; }
        }
    </style>
</head>
<body>
<div class="dashboard">
    <div class="header">
        <div class="title">
            <h1><i class="fas fa-seedling" style="color: #589a47;"></i> SRI Riego Inteligente</h1>
            <p>Monitoreo y control con inteligencia ambiental</p>
        </div>
        <div style="display: flex; gap: 12px;">
            <div class="status-badge"><i class="fas fa-cloud-upload-alt"></i> MQTT Conectado</div>
            <div class="admin-badge"><i class="fas fa-user-astronaut"></i> admin</div>
        </div>
    </div>

    <div class="nav">
        <span><i class="fas fa-chart-line"></i> Dashboard</span>
        <span><i class="fas fa-microchip"></i> Sensores</span>
        <span><i class="fas fa-water"></i> Riego</span>
        <span><i class="fas fa-flag-checkered"></i> Reportes</span>
    </div>

    <!-- Tarjetas de estado -->
    <div class="cards">
        <div class="card">
            <div class="card-icon"><i class="fas fa-tachometer-alt"></i></div>
            <h3>Humedad del suelo</h3>
            <div class="card-value"><span id="humedadVal">42</span>%</div>
            <div class="card-sub" id="humedadEstado">Óptimo</div>
        </div>
        <div class="card">
            <div class="card-icon"><i class="fas fa-water"></i></div>
            <h3>Agua disponible</h3>
            <div class="card-value"><i class="fas fa-check-circle" style="color: #529a45;"></i> Adecuado</div>
            <div class="card-sub">Nivel suficiente</div>
        </div>
        <div class="card">
            <div class="card-icon"><i class="fas fa-pump-water"></i></div>
            <h3>Bomba</h3>
            <div class="card-value" id="bombaEstadoDisplay"><span class="tag" style="background:#d9efce;">Encendida</span></div>
            <div class="card-sub" id="bombaSubtext">Funcionando</div>
        </div>
        <div class="card">
            <div class="card-icon"><i class="fas fa-robot"></i></div>
            <h3>Modo</h3>
            <div class="card-value" id="modoDisplay"><span class="tag">automatico</span></div>
            <div class="card-sub" id="modoSubtext">Riego automatico activo</div>
        </div>
    </div>

    <!-- Gráfico con más color -->
    <div class="chart-panel">
        <div class="chart-header">
            <h3><i class="fas fa-chart-line" style="color: #4c9f3a;"></i> Historial de humedad</h3>
            <div class="refresh-note"><i class="fas fa-sync-alt"></i> Actualizacion cada 3s</div>
        </div>
        <canvas id="humedadCanvas" width="800" height="260" style="width:100%; height:auto; aspect-ratio:800/260"></canvas>
        <div style="font-size:0.7rem; text-align:center; margin-top:0.6rem; color:#79a068;">Evolucion reciente (%)</div>
    </div>

    <!-- Controles y estado -->
    <div class="controls-section">
        <div class="buttons-panel">
            <h4> Control manual</h4>
            <div>
                <button class="btn" id="btnEncenderBomba"><i class="fas fa-play"></i> Encender Bomba</button>
                <button class="btn" id="btnApagarBomba"><i class="fas fa-stop"></i> Apagar Bomba</button>
                <button class="btn" id="btnIniciarRiego"><i class="fas fa-leaf"></i> Iniciar Riego</button>
                <button class="btn" id="btnDetenerRiego"><i class="fas fa-pause"></i> Detener Riego</button>
                <button class="btn" id="btnModoAuto" style="background:#d4e6cb;"><i class="fas fa-sync-alt"></i> Modo Automatico</button>
            </div>
            <div style="font-size:0.7rem; margin-top:12px; color:#85a777;"><i class="fas fa-info-circle"></i> Manual: fuerza estado de bomba. automatico: riego segun humedad (<35% enciende, >60% apaga).</div>
        </div>
        <div class="status-panel">
            <h4 style="font-size:0.85rem; margin-bottom:8px; font-weight:700; color:#3c7536;"><i class="fas fa-microchip"></i> Sistema operando</h4>
            <p><span class="dot-green"></span> <strong>ESP32:</strong> Conectado</p>
            <p><i class="fas fa-network-wired" style="color:#589a47;"></i> <strong>MQTT:</strong> Activo</p>
            <p><i class="fas fa-clock" style="color:#589a47;"></i> <strong>Ultima lectura:</strong> <span id="ultimaLectura">--:--:--</span></p>
            <hr>
            <p><i class="fas fa-tint" style="color:#4791b5;"></i> Modo actual: <span id="modoActualTexto">automatico</span></p>
        </div>
    </div>
    <div class="footer">
        <i class="fas fa-cloud-sun"></i> Sistema de riego inteligente datos simulados en tiempo real
    </div>
</div>

<script>
    (function(){
        let humedad = 42.0;
        let bombaEncendida = true;
        let modoAutomatico = true;

        let historial = [];
        const canvas = document.getElementById('humedadCanvas');
        const ctx = canvas.getContext('2d');

        function resizeCanvas() {
            const w = canvas.clientWidth;
            const h = 260;
            canvas.width = w;
            canvas.height = h;
            drawChart();
        }
        window.addEventListener('resize', () => resizeCanvas());

        function updateUI() {
            document.getElementById('humedadVal').innerText = Math.round(humedad);
            let estadoHum = '';
            if (humedad < 30) estadoHum = 'Seco  regar';
            else if (humedad >= 30 && humedad < 55) estadoHum = 'Óptimo ';
            else estadoHum = 'Humedo ';
            document.getElementById('humedadEstado').innerText = estadoHum;

            const bombaSpan = document.getElementById('bombaEstadoDisplay');
            const bombaSub = document.getElementById('bombaSubtext');
            if (bombaEncendida) {
                bombaSpan.innerHTML = '<span class="tag" style="background:#d9efce;">Encendida</span>';
                bombaSub.innerText = 'Funcionando riego activo';
            } else {
                bombaSpan.innerHTML = '<span class="tag" style="background:#ecefe8;">Apagada</span>';
                bombaSub.innerText = 'Inactiva reposo';
            }

            const modoSpan = document.getElementById('modoDisplay');
            const modoSub = document.getElementById('modoSubtext');
            const modoActualSpan = document.getElementById('modoActualTexto');
            if (modoAutomatico) {
                modoSpan.innerHTML = '<span class="tag">automatico</span>';
                modoSub.innerText = 'Riego automatico activo';
                modoActualSpan.innerText = 'automatico';
            } else {
                modoSpan.innerHTML = '<span class="tag" style="background:#f5f3e9;">Manual</span>';
                modoSub.innerText = 'Control manual';
                modoActualSpan.innerText = 'manual';
            }
        }

        function addToHistory(hum, timeStr) {
            historial.push({ humedad: hum, timestamp: timeStr });
            if (historial.length > 12) historial.shift();
            drawChart();
        }

        function drawChart() {
            if (!ctx) return;
            const w = canvas.width;
            const h = canvas.height;
            if (w === 0 || h === 0 || historial.length === 0) return;

            ctx.clearRect(0, 0, w, h);
            const padding = { left: 42, right: 28, top: 20, bottom: 32 };
            const graphW = w - padding.left - padding.right;
            const graphH = h - padding.top - padding.bottom;

            let minHum = Math.min(...historial.map(p => p.humedad), 20);
            let maxHum = Math.max(...historial.map(p => p.humedad), 70);
            minHum = Math.floor(minHum / 5) * 5;
            maxHum = Math.ceil(maxHum / 5) * 5;
            if (maxHum - minHum < 12) maxHum = minHum + 15;

            // grid
            ctx.beginPath();
            ctx.strokeStyle = "#dcecd4";
            ctx.lineWidth = 0.8;
            for (let i = 0; i <= 4; i++) {
                let yVal = minHum + (i / 4) * (maxHum - minHum);
                let y = padding.top + graphH - ((yVal - minHum) / (maxHum - minHum)) * graphH;
                ctx.beginPath();
                ctx.moveTo(padding.left - 2, y);
                ctx.lineTo(w - padding.right + 4, y);
                ctx.stroke();
                ctx.fillStyle = "#87a87a";
                ctx.font = "10px 'Inter'";
                ctx.fillText(Math.round(yVal) + "%", padding.left - 24, y + 3);
            }

            // área bajo la curva (más color)
            if (historial.length >= 2) {
                const stepX = graphW / (historial.length - 1);
                ctx.beginPath();
                let firstPoint = true;
                for (let i = 0; i < historial.length; i++) {
                    let x = padding.left + i * stepX;
                    let yVal = historial[i].humedad;
                    let y = padding.top + graphH - ((yVal - minHum) / (maxHum - minHum)) * graphH;
                    if (firstPoint) {
                        ctx.moveTo(x, y);
                        firstPoint = false;
                    } else {
                        ctx.lineTo(x, y);
                    }
                }
                ctx.lineTo(padding.left + (historial.length-1) * stepX, padding.top + graphH);
                ctx.lineTo(padding.left, padding.top + graphH);
                ctx.closePath();
                ctx.fillStyle = "#e3f3db";
                ctx.fill();
            }

            // línea
            if (historial.length >= 2) {
                ctx.beginPath();
                ctx.lineWidth = 2.5;
                ctx.strokeStyle = "#4c9f3a";
                ctx.lineJoin = "round";
                const stepX = graphW / (historial.length - 1);
                let first = true;
                for (let i = 0; i < historial.length; i++) {
                    let x = padding.left + i * stepX;
                    let yVal = historial[i].humedad;
                    let y = padding.top + graphH - ((yVal - minHum) / (maxHum - minHum)) * graphH;
                    if (first) { ctx.moveTo(x, y); first = false; }
                    else ctx.lineTo(x, y);
                }
                ctx.stroke();
                // puntos destacados
                for (let i = 0; i < historial.length; i++) {
                    let x = padding.left + i * stepX;
                    let yVal = historial[i].humedad;
                    let y = padding.top + graphH - ((yVal - minHum) / (maxHum - minHum)) * graphH;
                    ctx.beginPath();
                    ctx.fillStyle = "#2b7522";
                    ctx.arc(x, y, 4, 0, 2 * Math.PI);
                    ctx.fill();
                    ctx.beginPath();
                    ctx.fillStyle = "#ffffff";
                    ctx.arc(x, y, 1.8, 0, 2 * Math.PI);
                    ctx.fill();
                }
            }

            if (historial.length > 0) {
                const stepX = graphW / (historial.length - 1);
                for (let i = 0; i < historial.length; i += Math.max(1, Math.floor(historial.length / 4))) {
                    let x = padding.left + i * stepX;
                    let timeText = historial[i].timestamp.slice(0, 5);
                    ctx.fillStyle = "#7b9e6b";
                    ctx.font = "9px 'Inter'";
                    ctx.fillText(timeText, x - 12, h - padding.bottom + 12);
                }
                let last = historial[historial.length - 1].timestamp;
                ctx.fillStyle = "#488a38";
                ctx.font = "italic 9px 'Inter'";
                ctx.fillText("ultima: " + last, w - padding.right - 20, h - padding.bottom + 10);
            }
        }

        function getTimeString() {
            let d = new Date();
            return d.toLocaleTimeString('es-ES', { hour: '2-digit', minute: '2-digit', second: '2-digit' });
        }

        function aplicarLogica() {
            if (modoAutomatico) {
                if (humedad < 35 && !bombaEncendida) bombaEncendida = true;
                else if (humedad > 60 && bombaEncendida) bombaEncendida = false;
            }
            let delta = 0;
            if (bombaEncendida) delta = 0.8 + Math.random() * 1.6;
            else delta = -0.5 - Math.random() * 1.3;
            humedad += delta + (Math.random() - 0.5) * 0.4;
            humedad = Math.min(88, Math.max(18, humedad));
            humedad = Math.round(humedad * 10) / 10;
            let now = getTimeString();
            addToHistory(humedad, now);
            document.getElementById('ultimaLectura').innerText = now;
            updateUI();
        }

        function initHistory() {
            historial = [];
            let base = humedad;
            for (let i = 11; i >= 0; i--) {
                let fake = base + (Math.random() - 0.5) * 5 - i * 0.15;
                fake = Math.min(75, Math.max(28, fake));
                fake = Math.round(fake * 10) / 10;
                let d = new Date();
                d.setSeconds(d.getSeconds() - (11 - i) * 3);
                let lbl = d.toLocaleTimeString('es-ES', { hour: '2-digit', minute: '2-digit', second: '2-digit' });
                historial.push({ humedad: fake, timestamp: lbl });
            }
            drawChart();
        }

        function setModoManual() {
            if (modoAutomatico) {
                modoAutomatico = false;
                updateUI();
            }
        }

        document.getElementById('btnEncenderBomba').onclick = () => { setModoManual(); bombaEncendida = true; updateUI(); };
        document.getElementById('btnApagarBomba').onclick = () => { setModoManual(); bombaEncendida = false; updateUI(); };
        document.getElementById('btnIniciarRiego').onclick = () => { setModoManual(); bombaEncendida = true; updateUI(); };
        document.getElementById('btnDetenerRiego').onclick = () => { setModoManual(); bombaEncendida = false; updateUI(); };
        document.getElementById('btnModoAuto').onclick = () => {
            modoAutomatico = true;
            if (humedad < 35 && !bombaEncendida) bombaEncendida = true;
            else if (humedad > 60 && bombaEncendida) bombaEncendida = false;
            updateUI();
        };

        function start() {
            resizeCanvas();
            initHistory();
            updateUI();
            document.getElementById('ultimaLectura').innerText = getTimeString();
            setInterval(() => aplicarLogica(), 3000);
        }
        window.addEventListener('load', start);
    })();
</script>
</body>
</html>