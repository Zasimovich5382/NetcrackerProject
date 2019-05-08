package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.domain.Artist;
import com.netcracker.musitians_along.repos.ArtistRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class SearchController {

    @Autowired
    private ArtistRepo artistRepo;

    @GetMapping("/searchArtist")
    public Page searchArtist(@RequestParam String name,
                             @RequestParam String p){

        Integer page = Integer.parseInt(p);
        Pageable pageable = new PageRequest(page,3);
        Page<Artist> listSearch = artistRepo.findByNameContaining(name, pageable);
        return listSearch;
    }
}
