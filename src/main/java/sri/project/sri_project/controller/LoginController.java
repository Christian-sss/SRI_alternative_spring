package sri.project.sri_project.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {


    @GetMapping("/login")
    public String inicio(Model model) {

        model.addAttribute("mensaje", "Entonces se puede cambiar desde un metodo");

        return "login";
    }

}
