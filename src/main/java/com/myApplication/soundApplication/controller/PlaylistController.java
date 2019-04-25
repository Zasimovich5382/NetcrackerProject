package com.myApplication.soundApplication.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.myApplication.soundApplication.AppConstants;


@Controller
public class PlaylistController {
    @GetMapping("/playlist")
    public String playlist(){
        return AppConstants.PLAYLIST;
    }



}