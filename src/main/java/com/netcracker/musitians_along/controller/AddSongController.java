package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.AppConstants;
import com.netcracker.musitians_along.domain.Song;
import com.netcracker.musitians_along.domain.User;
import com.netcracker.musitians_along.repos.SongRepo;
import com.netcracker.musitians_along.repos.UserRepo;
import com.netcracker.musitians_along.service.SaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@Controller
@RequestMapping("/addSong")
public class AddSongController {
    @Autowired
    private SongRepo songRepo;

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private SaveService saveService;

    @Value("${upload.path}")
    private String uploadPath;



    @GetMapping
    public String addSong(){
        return AppConstants.ADDSONG;
    }

    @PostMapping
    public String addNewSong(@AuthenticationPrincipal User user,
                                 @RequestParam ("file") MultipartFile file,
                                 Map<String, Object> model){
        Song song = saveService.extractMeta(file, user, file);
        songRepo.save(song);
        return "redirect:/userLibrary";
    }
}
