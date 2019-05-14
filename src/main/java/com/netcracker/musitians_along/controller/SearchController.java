package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.domain.User;
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

    @GetMapping("/searchArtist")
    public Page searchArtist(@RequestParam String name,
                             @RequestParam String p){

        Integer page = Integer.parseInt(p);
        Pageable pageable = new PageRequest(page,3);
        Page<User> listSearch = userRepo.findByNicknameContaining(name, pageable);
        return listSearch;
    }
}
