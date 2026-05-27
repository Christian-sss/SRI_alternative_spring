package sri.project.sri_project.controller;


import lombok.AllArgsConstructor;
import net.sf.jasperreports.engine.JRException;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import sri.project.sri_project.service.ReporteService;

import java.io.FileNotFoundException;


@AllArgsConstructor
@Controller
public class ReporteController {


    private final ReporteService reporteService;

    @GetMapping("/reportes/modos-riego")
    public ResponseEntity<byte[]> descargarReporteRiegos() {
        try {
            byte[] reportePdf = reporteService.generarReporteModosRiegoPDF();

            HttpHeaders headers = new HttpHeaders();
            // Para que se abra en el navegador en lugar de forzar la descarga, usa INLINE
            headers.set(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=reporte_riegos.pdf");
            headers.setContentType(MediaType.APPLICATION_PDF);

            return new ResponseEntity<>(reportePdf, headers, HttpStatus.OK);

        } catch (JRException | FileNotFoundException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
