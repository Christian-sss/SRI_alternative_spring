/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sri.project.sri_project.service.serviceImpl;

import lombok.AllArgsConstructor;
import lombok.Data;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import sri.project.sri_project.dto.ReporteModoRiegoDTO;
import sri.project.sri_project.model.enums.ModoRiego;
import sri.project.sri_project.repository.EventoRiegoRepository;
import sri.project.sri_project.service.ReporteService;

import javax.sql.DataSource;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Usuario
 */


@AllArgsConstructor
@Service
public class ReporteServiceImpl implements ReporteService {



    private EventoRiegoRepository eventoRiegoRepository;

    @Override
    public byte[] generarReporteModosRiegoPDF() throws JRException, FileNotFoundException {

        // 1. Obtener los datos del Repositorio
        List<Object[]> resultados = eventoRiegoRepository.contarRiegosPorModoMesActual();
        List<ReporteModoRiegoDTO> datosReporte = new ArrayList<>();

        for (Object[] fila : resultados) {
            ModoRiego modo = (ModoRiego) fila[0];
            Long cantidad = (Long) fila[1];

            // Instanciamos el Record de forma directa y limpia
            datosReporte.add(new ReporteModoRiegoDTO(modo, cantidad));
        }

    // Carga el archivo directamente desde el classpath usando un Stream de datos
        InputStream reporteStream = getClass().getResourceAsStream("/reportes/grafico_modos_riego.jrxml");

        if (reporteStream == null) {
            throw new FileNotFoundException("No se encontró el archivo jrxml en resources/reportes/");
        }

        JasperReport jasperReport = JasperCompileManager.compileReport(reporteStream);
        // 3. Pasar la lista de Records a Jasper
        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(datosReporte);

        Map<String, Object> parameters = new HashMap<>();
        parameters.put("creadoPor", "Sistema SRI - Administrador");

        // 4. Llenar y exportar a PDF
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);
        return JasperExportManager.exportReportToPdf(jasperPrint);
    }
    
    
}
