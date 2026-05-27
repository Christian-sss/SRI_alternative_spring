package sri.project.sri_project.controller;


import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import sri.project.sri_project.model.enums.ModoRiego;
import sri.project.sri_project.repository.EventoRiegoRepository;
import java.util.*;


@AllArgsConstructor
@Controller
public class DashboardController {

    private final EventoRiegoRepository eventoRiegoRepository;

    @GetMapping("/estadisticas")
    public String mostrarEstadisticas(Model model) {
        long countManual = 0;
        long countAutomatico = 0;

        // 1. Envolver en un bloque try-catch para que si la BD falla, la página cargue igual con ceros
        try {
            List<Object[]> riegosPorModo = eventoRiegoRepository.contarRiegosPorModoMesActual();

            if (riegosPorModo != null) {
                for (Object[] fila : riegosPorModo) {
                    if (fila != null && fila[0] != null && fila[1] != null) {
                        ModoRiego modo = (ModoRiego) fila[0];
                        Long cantidad = (Long) fila[1];
                        if (modo == ModoRiego.MANUAL) countManual = cantidad;
                        if (modo == ModoRiego.AUTOMATICO) countAutomatico = cantidad;
                    }
                }
            }
        } catch (Exception e) {
            // Imprime el error real en la consola de IntelliJ para saber qué falló exactamente
            System.err.println("⚠️ Error al obtener datos de la BD: " + e.getMessage());
            e.printStackTrace();
        }

        // 2. Datos quemados seguros para el gráfico de barras
        String fechasJS = "['Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab', 'Dom']";
        String duracionJS = "[1200, 1500, 900, 1800, 2000, 800, 1000]";

        // 3. Inyectar al modelo (asegurando que jamás vayan nulos)
        model.addAttribute("manuales", countManual);
        model.addAttribute("automaticos", countAutomatico);
        model.addAttribute("labelsDias", fechasJS);
        model.addAttribute("datosDuracion", duracionJS);

        return "estadisticas";
    }


}
