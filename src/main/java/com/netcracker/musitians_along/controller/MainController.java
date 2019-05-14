package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.AppConstants;
import com.netcracker.musitians_along.domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MainController {

    @GetMapping("/"+ AppConstants.SEARCH)
    public String getSearch(){
        return AppConstants.SEARCH;
    }

    @GetMapping("/"+ AppConstants.ARTIST +"/{user}")
    public String getArtist(@PathVariable User user, Model model){
        model.addAttribute("user", user);
        return AppConstants.ARTIST;
    }

    @GetMapping("/index")
    public String geh(){
        return "index";
    }

    @GetMapping("/index2")
    public String geh2(){
        return "index2";
    }
}


