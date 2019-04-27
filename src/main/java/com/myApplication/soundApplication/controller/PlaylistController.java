package com.myApplication.soundApplication.controller;

import com.myApplication.soundApplication.domain.Playlist;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.myApplication.soundApplication.AppConstants;

import java.util.Map;


@Controller
public class PlaylistController {
    @GetMapping("/playlist/{playlist}")
    public String playlist(@PathVariable Playlist playlist, Map<String,Object> model){
        model.put("playlist", playlist);
        return AppConstants.PLAYLIST;
    }



}