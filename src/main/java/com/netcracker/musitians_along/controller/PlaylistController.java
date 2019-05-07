package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.domain.Playlist;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.netcracker.musitians_along.AppConstants;

import java.util.Map;


@Controller
public class PlaylistController {
    @GetMapping("/playlist/{playlist}")
    public String playlist(@PathVariable Playlist playlist, Map<String,Object> model){
        model.put("playlist", playlist);
        return AppConstants.PLAYLIST;
    }



}