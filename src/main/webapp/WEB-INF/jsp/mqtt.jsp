<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>MQTT Panel</title>

    <style>

        body{
            font-family: Arial;
            margin: 40px;
        }

        .card{
            width: 400px;
            padding: 20px;
            border-radius: 10px;
            border: 1px solid #ccc;
        }

        input{
            width: 100%;
            padding: 10px;
            margin-top: 10px;
        }

        button{
            margin-top: 15px;
            padding: 10px 20px;
            cursor: pointer;
        }

        .estado{
            font-size: 18px;
            margin-bottom: 20px;
        }

    </style>

</head>
<body>

<div class="card">

    <h2>Panel MQTT</h2>

    <div class="estado">
        Estado MQTT:
        <strong>${estado}</strong>
    </div>

    <!-- BOTÓN CONECTAR -->
    <form action="/mqtt/connect" method="post">

        <button type="submit">
            Conectar MQTT
        </button>

    </form>

    <hr>

    <!-- PUBLICAR MENSAJE -->
    <form action="/mqtt/publish" method="post">

        <label>Topic:</label>

        <input
                type="text"
                name="topic"
                placeholder="sensores/bomba"
                required
        >

        <label>Mensaje:</label>

        <input
                type="text"
                name="mensaje"
                placeholder="ON"
                required
        >

        <button type="submit">
            Enviar mensaje
        </button>

    </form>

</div>

</body>
</html>