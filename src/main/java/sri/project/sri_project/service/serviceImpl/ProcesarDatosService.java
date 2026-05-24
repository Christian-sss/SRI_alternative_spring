package sri.project.sri_project.service.serviceImpl;


import sri.project.sri_project.model.dto.SensorData;
import sri.project.sri_project.model.TanqueAgua;
import sri.project.sri_project.model.Policy.SeguridadHidrica;
import org.springframework.stereotype.Service;

@Service
public class ProcesarDatosService {


    private TanqueAgua tanque;
    private SeguridadHidrica seguridadHidrica;

    public ProcesarDatosService(TanqueAgua tanque, SeguridadHidrica seguridadHidrica) {
        this.tanque = tanque;
        this.seguridadHidrica = seguridadHidrica;
    }

    public void procesar(SensorData data) {

        tanque.actualizarDatos(
                data.humedad(),
                data.distancia()
        );

        seguridadHidrica.evaluarEstado(tanque);
    }

}
