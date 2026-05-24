/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sri.project.sri_project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 *
 * @author Usuario
 */

@Repository
public interface EstadisticasRepository extends JpaRepository<Map<String,Double>,Integer> {



    @Query(name = "")
    Map<String, Double> obtenerHumedadPromedioPorHora();

    Map<String, Integer> obtenerConteoModosRiego();

    void guardarLecturaSensores(int humedad, int distancia);

    void registrarSesionRiego(String modo, int humedadInicial, int humedadFinal, String motivo);
}
