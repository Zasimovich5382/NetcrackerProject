package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.domain.Artist;
import com.netcracker.musitians_along.repos.ArtistRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class SearchController {

    @Autowired
    private ArtistRepo artistRepo;

    @GetMapping("/searchArtist")
    public List searchArtist(@RequestParam String name){
        List<Artist> listSearch = artistRepo.findByNameContaining(name);
        return listSearch;
    }
}
