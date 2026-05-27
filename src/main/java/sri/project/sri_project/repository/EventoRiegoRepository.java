package sri.project.sri_project.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import sri.project.sri_project.model.EventoRiego;

import java.util.List;

@Repository
public interface EventoRiegoRepository extends JpaRepository<EventoRiego,Long> {


// ---------------------------------------------------------
    // GRÁFICO 1: Dona/Pastel (Manual vs Automático del mes actual)
    // Usamos JPQL para contar directamente las entidades
    // ---------------------------------------------------------


    /*
    *
    * Para el grafico de Dona.
    * Comparativa de manual y automatico en el mes
    * */

    @Query("SELECT e.modoRiego, COUNT(e)" +
            " FROM EventoRiego e " +
            "WHERE FUNCTION('MONTH', e.fechaInicio) = FUNCTION('MONTH', CURRENT_DATE) " +
            "AND FUNCTION('YEAR', e.fechaInicio) = FUNCTION('YEAR', CURRENT_DATE) " +
            "GROUP BY e.modoRiego")
    List<Object[]> contarRiegosPorModoMesActual();



    // GRÁFICO 2: Eficiencia (Humedad ganada en riegos completados)
    // JPQL puro aprovechando que cambiamos a valores INT

    @Query("SELECT e.fechaInicio, (e.humedadSueloFinal - e.humedadSueloInicial) FROM EventoRiego e " +
            "WHERE e.estado = 'COMPLETADO' AND e.cultivo.id = :cultivoId " +
            "ORDER BY e.fechaInicio DESC")
    List<Object[]> calcularHumedadGanadaPorCultivo(@Param("cultivoId") Integer cultivoId);




    // GRÁFICO 3: Barras (Consumo de tiempo de riego de los últimos 7 días)
    // Usamos Consulta Nativa para usar TIMESTAMPDIFF de MySQL

    @Query(value = "SELECT DATE(fecha_inicio) as fecha, SUM(TIMESTAMPDIFF(SECOND, fecha_inicio, fecha_fin)) as duracion_segundos " +
            "FROM eventos_riego " +
            "WHERE fecha_inicio >= NOW() - INTERVAL 7 DAY AND estado = 'COMPLETADO' " +
            "GROUP BY DATE(fecha_inicio) " +
            "ORDER BY fecha", nativeQuery = true)
    List<Object[]> obtenerDuracionDiariaUltimos7Dias();




}
