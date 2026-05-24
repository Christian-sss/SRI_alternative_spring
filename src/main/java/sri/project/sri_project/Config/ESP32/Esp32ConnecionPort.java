package sri.project.sri_project.Config.ESP32;

import com.fazecast.jSerialComm.SerialPort;

public interface Esp32ConnecionPort {

    boolean conectar(String puertoNombre);
    void escribirABytes(byte[] data);

    SerialPort getSerialPort();
    boolean estaConectado();
}
