package sri.project.sri_project.service;

import java.util.Map;

public interface EstadisticasService {

    Map<String, Double> obtenerDatosHumedadHistorica();
    Map<String, Integer> obtenerDatosModosRiego();

}
