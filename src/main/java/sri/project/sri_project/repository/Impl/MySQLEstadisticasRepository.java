/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sri.project.sri_project.repository.Impl;


import sri.project.sri_project.repository.EstadisticasRepository;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Usuario
 */


@Repository
public class MySQLEstadisticasRepository  {

    private final JdbcTemplate jdbcTemplate;
    public MySQLEstadisticasRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String OBTENER_HUMEDAD_PROMEDIO = """
             SELECT DATE_FORMAT(fecha_hora, '%H:00') as hora, AVG(humedad_suelo) as promedio
             FROM telemetria_sensores 
             WHERE DATE(fecha_hora) = CURDATE()
             GROUP BY HOUR(fecha_hora)
             ORDER BY fecha_hora ASC                          
    """;
    
    private static final String OBTENER_CONTEO = """
               SELECT modo_riego, COUNT(*) as cantidad  
               FROM sesiones_riego
               GROUP BY modo_riego                                 
    """;

    private static final String GUARDAR_DATOS = """
            INSERT INTO telemetria_sensores (humedad_suelo, distancia_agua_cm) VALUES
             (?, ?)";
            
            """;

    private static final String REGISTRAR_DATOS = """
            INSERT INTO sesiones_riego (modo_riego, humedad_inicial, humedad_final, motivo_parada) VALUES
             (?, ?, ?, ?);
            
            """;




    public void guardarLecturaSensores(int humedad, int distancia) {

        jdbcTemplate.update(
                GUARDAR_DATOS,
                humedad,
                distancia
        );
    }


    public void registrarSesionRiego(String modo, int humedadInicial, int humedadFinal, String motivo) {

        jdbcTemplate.update(
                REGISTRAR_DATOS,
                modo,
                humedadInicial,
                humedadFinal,
                motivo
        );


    }



    public Map<String, Double> obtenerHumedadPromedioPorHora() {



        List<Map<String, Object>> rows = jdbcTemplate.queryForList(
                OBTENER_HUMEDAD_PROMEDIO
        );

        Map<String, Double> datos = new LinkedHashMap<>();

        for (Map<String, Object> row : rows) {

            String hora = (String) row.get("hora");

            Double promedio =
                    ((Number) row.get("promedio")).doubleValue();

            datos.put(hora, promedio);
        }

        return datos;
    }


    public Map<String, Integer> obtenerConteoModosRiego() {
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(
                OBTENER_CONTEO
        );

        Map<String, Integer> datos = new LinkedHashMap<>();

        for (Map<String, Object> row : rows) {

            String modo = (String) row.get("modo_riego");

            Integer cantidad =
                    ((Number) row.get("cantidad")).intValue();

            datos.put(modo, cantidad);
        }

        return datos;

    }
    
    
    
    
    
}
