package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.domain.Artist;
import com.netcracker.musitians_along.domain.Song;
import com.netcracker.musitians_along.domain.User;
import com.netcracker.musitians_along.repos.ArtistRepo;
import com.netcracker.musitians_along.repos.SongRepo;
import com.netcracker.musitians_along.service.SaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@RestController
public class ArtistController {

    @Autowired
    private SongRepo songRepo;

    @Autowired
    private ArtistRepo artistRepo;

    @Autowired
    private SaveService saveService;

    @RequestMapping(value ="/artist/song/add", method = RequestMethod.POST)
    public Map addSong(
            @RequestParam ("img") MultipartFile img,
            @RequestParam ("audio") MultipartFile audio,
            @AuthenticationPrincipal User user,
            Map<String, Object> model){

        Song song = saveService.extractMeta(audio, user, img);
        songRepo.save(song);

        Artist artist = artistRepo.findByUser(user);
        artist.getSongs().add(song);
        artistRepo.save(artist);

        model.put("song", song);

        return model;
    }

    @RequestMapping(value ="/editArtist", method = RequestMethod.POST)
    public Map edit(
            @RequestParam ("avatar") MultipartFile avatar,
            @RequestParam String nickname,
            @AuthenticationPrincipal User user,
            Map<String, Object> model){

        Artist artist = artistRepo.findByUser(user);
        artist.setName(nickname);
        /*String img = saveService.transfer(avatar);
        artist.setAvatar(img);*/
        artistRepo.save(artist);

        model.put("artist", artist);

        return model;
    }


}
