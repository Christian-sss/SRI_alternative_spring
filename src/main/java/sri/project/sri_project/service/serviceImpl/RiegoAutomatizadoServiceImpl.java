package sri.project.sri_project.service.serviceImpl;

import sri.project.sri_project.model.EstadoSistema;
import sri.project.sri_project.service.DetenerRiegoService;
import sri.project.sri_project.service.IniciarRiegoService;
import sri.project.sri_project.service.RiegoAutomatizadosService;
import org.springframework.stereotype.Service;
import sri.project.sri_project.model.TanqueAgua;


@Service
public class RiegoAutomatizadoServiceImpl implements RiegoAutomatizadosService {

    private final IniciarRiegoService riegoInicioManual;
    private final DetenerRiegoService riegoDetenido;
    private final TanqueAgua tanque;



    private static final int HUMEDAD_MINIMA = 30;
    private static final int HUMEDAD_MAXIMA = 60;
    public RiegoAutomatizadoServiceImpl(IniciarRiegoService riegoInicio, DetenerRiegoService riegoDetenido, TanqueAgua tanque) {
        this.riegoInicioManual = riegoInicio;
        this.riegoDetenido = riegoDetenido;
        this.tanque = tanque;

    }

    @Override
    public String ejecutar() {

        riegoInicioManual.ejecutar();


        if (tanque.getEstadoActual() == EstadoSistema.BLOQUEADO_SIN_AGUA) {

            return " Automático cancelado: " + tanque.getEstadoActual().descripcion();
        }

        iniciarVigilanteEnSegundoPlano();

        return "Riego Inteligente INICIADO. Se detendrá solo al alcanzar " + HUMEDAD_MAXIMA + "% de humedad.";
    }


    private void iniciarVigilanteEnSegundoPlano() {
        new Thread(() -> {
            try {
                System.out.println(" Iniciando monitoreo inteligente...");
                int humedadAlIniciar = tanque.getHumedad();

                while (tanque.isBombaActiva() && tanque.getHumedad() < HUMEDAD_MAXIMA && tanque.hayAgua()) {
                    System.out.println(" Humedad: " + tanque.getHumedad() +
                            "%, Distancia Agua: " + tanque.getDistancia() + "cm");
                    Thread.sleep(2000);
                }


                System.out.println("REPORTE");
                if (!tanque.isBombaActiva()) System.out.println("Alguien apagó la bomba manualmente.");
                if (tanque.getHumedad() >= HUMEDAD_MAXIMA) System.out.println("Motivo: Humedad objetivo (" + HUMEDAD_MAXIMA + "%) alcanzada.");
                if (!tanque.hayAgua()) System.out.println("EL TANQUE SE QUEDÓ SIN AGUA! (Distancia > 18cm)");



                if (tanque.isBombaActiva()) {
                    System.out.println(" Condición de parada alcanzada. Deteniendo bomba...");
                    riegoDetenido.ejecutar();
                }

            } catch (InterruptedException e) {
                System.err.println("[AUTO] Hilo de monitoreo interrumpido.");
                Thread.currentThread().interrupt();
            } catch (Exception e) {
                System.err.println(" ERROR FATAL EN EL HILO SECUNDARIO:");
                e.printStackTrace();
            }
        }).start();
    }


}
