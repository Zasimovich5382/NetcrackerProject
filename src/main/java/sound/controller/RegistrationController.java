package sound.controller;

import sound.domain.Role;
import sound.domain.User;
import sound.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import java.util.Collections;

import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepo UserRepo;
    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }
    @PostMapping("/registration")

    public String addUser(User user, Map<String,Object>model){
        User UserFromDb = UserRepo.findByUsername(user.getUsername());
        if (UserFromDb!=null){
            model.put("message","User exist!");
            return "/registration";
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        UserRepo.save(user);
        return "redirect:/login";
    }

}
