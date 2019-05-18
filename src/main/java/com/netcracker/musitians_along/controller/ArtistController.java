package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.domain.Song;
import com.netcracker.musitians_along.domain.User;
import com.netcracker.musitians_along.repos.SongRepo;
import com.netcracker.musitians_along.repos.UserRepo;
import com.netcracker.musitians_along.service.SaveService;
import com.netcracker.musitians_along.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
public class ArtistController {

    @Autowired
    private SongRepo songRepo;

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private UserService userService;

    @Autowired
    private SaveService saveService;

    @RequestMapping(value ="/addPublicSong", method = RequestMethod.POST)
    public Song addPublicSong(
            @RequestParam ("avatar") MultipartFile avatar,
            @RequestParam ("background") MultipartFile background) throws IOException{

        User user = userService.authUser();

        Song song = saveService.extractMeta(background,user,avatar);
        song.setPublicSong(true);

        songRepo.save(song);

        return song;
    }

    @RequestMapping(value ="/editArtist", method = RequestMethod.POST)
    public User edit(
            @RequestParam ("avatar") MultipartFile avatar,
            @RequestParam ("background") MultipartFile background,
            @RequestParam String nickname,
            @RequestParam String city,
            @AuthenticationPrincipal User user)throws IOException {

        user.setNickname(nickname);
        user.setCity(city);
        String img = saveService.transfer(avatar);
        String backgr = saveService.transfer(background);
        user.setAvatar(img);
        user.setBackground(backgr);
        userRepo.save(user);


        return user;
    }



    @RequestMapping(value ="/delPublicSong", method = RequestMethod.POST)
    public Iterable delPublicSong(
            @RequestParam ("id") Long id){

        User user = userService.authUser();

        Song song = songRepo.findFirstById(id);

        songRepo.delete(song);

        Iterable<Song> list = songRepo.findAll();

        return list;
    }


}
