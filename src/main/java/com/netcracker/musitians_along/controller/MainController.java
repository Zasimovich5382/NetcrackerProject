package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.AppConstants;
import com.netcracker.musitians_along.domain.Artist;
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

    @GetMapping("/"+ AppConstants.ARTIST +"/{artist}")
    public String getArtist(@PathVariable Artist artist, Model model){
        model.addAttribute("artist", artist);
        return AppConstants.ARTIST;
    }
}
