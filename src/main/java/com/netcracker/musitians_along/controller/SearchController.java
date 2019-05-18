package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.domain.Song;
import com.netcracker.musitians_along.domain.User;
import com.netcracker.musitians_along.repos.SongRepo;
import com.netcracker.musitians_along.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

@RestController
public class SearchController {

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private SongRepo songRepo;

    @GetMapping("/searchArtist")
    public Page searchArtist(@RequestParam String name,
                             @RequestParam String p){

        Integer page = Integer.parseInt(p);
        Pageable pageable = new PageRequest(page,3);
        Page<User> listSearch = userRepo.findByNicknameContaining(name, pageable);
        return listSearch;
    }

    @GetMapping("/searchSongs/artist")
    public Page searchSongs(@RequestParam String name,
                             @RequestParam String p){
        if(name.length() > 3) {
            Integer page = Integer.parseInt(p);
            Pageable pageable = new PageRequest(page, 3);
            Page<Song> listSearch = songRepo.findByArtistContaining(name, pageable);
            return listSearch;
        }
        return null;
    }

    @GetMapping("/searchSongs/title")
    public Page searchTitle(@RequestParam String name,
                            @RequestParam String p){

        if(name.length() > 3){
            Integer page = Integer.parseInt(p);
            Pageable pageable = new PageRequest(page,3);
            Page<Song> listSearch = songRepo.findByTitleContaining(name, pageable);
            return listSearch;

        }


        return null;
    }
}
