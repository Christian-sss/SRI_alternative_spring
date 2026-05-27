package sri.project.sri_project.service;

import net.sf.jasperreports.engine.JRException;

import java.io.FileNotFoundException;

public interface ReporteService {
    public byte[] generarReporteModosRiegoPDF() throws JRException, FileNotFoundException;
}
