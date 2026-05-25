package sri.project.sri_project.integration;


import jakarta.annotation.PostConstruct;
import lombok.Getter;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.springframework.stereotype.Component;

@Component
public class Esp32MqttConnectionManager {


    private String broker = "ssl://d293d13a6a7c49bbbc434365cac41121.s1.eu.hivemq.cloud:8883";
    private String clientId = "JavaAppClient";
    @Getter
    private MqttClient client;


    @PostConstruct
    public void conectar() {


        try {

            MemoryPersistence persistence = new MemoryPersistence();

            client = new MqttClient(broker, clientId, persistence);

            MqttConnectOptions options = new MqttConnectOptions();

            options.setUserName("saulupt");
            options.setPassword("Sistema_riego123".toCharArray());

            options.setCleanSession(true);
            options.setConnectionTimeout(10);
            options.setKeepAliveInterval(60);

            System.out.println("[MQTT] Conectando...");

            client.connect(options);

            System.out.println("[MQTT] Conexión exitosa");

        } catch (MqttException ex) {

            System.err.println("[MQTT] Error conexión");

            ex.printStackTrace();
        }

    }


    public void publish(String topic, String payload) {
        try {
            MqttMessage message = new MqttMessage(payload.getBytes());

            message.setQos(1);

            client.publish(topic, message);

        } catch (MqttException e) {

            System.err.println("[MQTT] Error publicando");

            e.printStackTrace();
        }

    }

    public boolean estaConectado() {
        return client != null && client.isConnected();
    }

}
