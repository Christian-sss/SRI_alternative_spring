/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sri.project.sri_project.Config.ESP32;

import org.springframework.stereotype.Component;

/**
 *
 * @author Usuario
 */





@Component
public class Esp32SerialRiego implements RiegoPort {
    

    private final Esp32ConnecionPort port;
    
    public Esp32SerialRiego(Esp32ConnecionPort connectionManager) {
        this.port = connectionManager;
    }
    

    @Override
    public void enviarComando(int comando) {
        if (port != null && port.estaConectado()) {
            String cmd = comando + "\n";
            byte[] data = cmd.getBytes();
            port.escribirABytes(data);
        } else {
            System.err.println("Puerto no se logro conectar");
        }
    }

    
}
