package sri.project.sri_project.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {


    @GetMapping("/sensores")
    public String sensores() {
        return "sensor";
    }

    @GetMapping("/riego")
    public String riegos() {
        return "riego";
    }

    @GetMapping("/reportes")
    public String reportes() {
        return "reportes";
    }


    @GetMapping("/  ")
    public String home() {
        return "redirect:/dashboard";
    }


}
