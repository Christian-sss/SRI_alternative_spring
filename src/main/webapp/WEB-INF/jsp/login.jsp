<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Riego Inteligente - Acceso</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            background: #cce6bd;
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
        }
        .login-container {
            background: white;
            border-radius: 32px;
            box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            width: 100%;
            max-width: 380px;
            text-align: center;
        }
        .login-container i {
            font-size: 3rem;
            color: #589a47;
            margin-bottom: 0.5rem;
        }
        h2 {
            color: #2c5e2a;
            margin-bottom: 0.5rem;
            font-weight: 700;
        }
        .sub {
            color: #6f8f60;
            margin-bottom: 1.5rem;
            font-size: 0.85rem;
        }
        .input-group {
            text-align: left;
            margin-bottom: 1.2rem;
        }
        label {
            font-size: 0.8rem;
            font-weight: 600;
            color: #3c5e34;
            display: block;
            margin-bottom: 0.3rem;
        }
        input {
            width: 100%;
            padding: 0.7rem 1rem;
            border-radius: 60px;
            border: 1px solid #cfe0c5;
            font-family: inherit;
            font-size: 0.9rem;
            outline: none;
            transition: 0.2s;
        }
        input:focus {
            border-color: #6dae5a;
            box-shadow: 0 0 0 2px #d0ecbf;
        }
        button {
            background: #4c9f3a;
            border: none;
            width: 100%;
            padding: 0.7rem;
            border-radius: 60px;
            font-weight: 700;
            color: white;
            font-size: 1rem;
            cursor: pointer;
            transition: 0.1s;
            margin-top: 0.5rem;
        }
        button:hover {
            background: #3e8730;
        }
        .error-msg {
            color: #d9534f;
            font-size: 0.75rem;
            margin-top: 0.8rem;
        }
        .demo-note {
            margin-top: 1rem;
            font-size: 0.7rem;
            color: #aaa;
        }
    </style>
</head>
<body>
<div class="login-container">
    <i class="fas fa-seedling"></i>
    <h2>Sistema de Riego Inteligente</h2>
    <div class="sub">Acceso autorizado</div>

    <form id="loginForm" action="javascript:void(0);">
        <div class="input-group">
            <label> Usuario</label>
            <input type="text" id="username" placeholder="admin" required autofocus>
        </div>
        <div class="input-group">
            <label> Contraseña</label>
            <input type="password" id="password" placeholder="••••••" required>
        </div>
        <button type="submit">Ingresar</button>
    </form>
    <div id="errorMsg" class="error-msg"></div>

</div>

<script>
    // Validación simple (solo frontend, sin backend)
    // Si quieres validar contra Spring Boot, cambia la lógica por un fetch a /login
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        const username = document.getElementById('username').value.trim();
        const password = document.getElementById('password').value.trim();
        const errorDiv = document.getElementById('errorMsg');

        if (username === 'admin' && password === 'sri2025') {
            // Redirige al dashboard real (ajusta la ruta según tu proyecto)
            window.location.href = 'dashboard_alt.jsp';
        } else {
            errorDiv.innerText = 'Usuario o contraseña incorrectos';
        }
    });

    // Opcional: permitir Enter
    document.getElementById('password').addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            document.getElementById('loginForm').dispatchEvent(new Event('submit'));
        }
    });
</script>
</body>
</html>