package sri.project.sri_project.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import sri.project.sri_project.integration.Esp32MqttConnectionManager;

@Controller
@RequestMapping("/mqtt")
@RequiredArgsConstructor
public class MqttController {

    private final Esp32MqttConnectionManager mqttManager;

    @GetMapping
    public String vistaMqtt(Model model) {

        String estado = mqttManager.estaConectado()
                ? "CONECTADO"
                : "DESCONECTADO";

        model.addAttribute("estado", estado);

        return "mqtt";
    }

    @PostMapping("/connect")
    public String connect() {

        mqttManager.conectar();

        return "redirect:/mqtt";
    }

    @PostMapping("/publish")
    public String publish(
            @RequestParam String topic,
            @RequestParam String mensaje
    ) {

        mqttManager.publish(topic, mensaje);

        return "redirect:/mqtt";
    }

}