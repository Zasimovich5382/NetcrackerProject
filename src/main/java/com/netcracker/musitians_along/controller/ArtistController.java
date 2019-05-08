package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.domain.Artist;
import com.netcracker.musitians_along.domain.Song;
import com.netcracker.musitians_along.domain.User;
import com.netcracker.musitians_along.repos.ArtistRepo;
import com.netcracker.musitians_along.repos.SongRepo;
import com.netcracker.musitians_along.service.SaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.URISyntaxException;
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
    public Song addSong(
            @RequestParam ("audio") MultipartFile audio,
            @RequestParam ("image") MultipartFile img,

            @AuthenticationPrincipal User user){

        Song song = saveService.extractMeta(audio, user, img);
        songRepo.save(song);

        Artist artist = artistRepo.findByUser(user);
        artist.getSongs().add(song);

        artistRepo.save(artist);

        return song;
    }

    @RequestMapping(value ="/editArtist", method = RequestMethod.POST)
    public Artist edit(
            @RequestParam ("avatar") MultipartFile avatar,
            @RequestParam ("background") MultipartFile background,
            @RequestParam String nickname,
            @RequestParam String city,
            /*@RequestBody Map<String,Object> map,*/
            @AuthenticationPrincipal User user)throws IOException {
        /*MultipartFile avatar = (MultipartFile)map.get("avatar");
        MultipartFile background = (MultipartFile)map.get("background");
        String nickname = (String) map.get("nickname");
        String city = (String) map.get("city");*/

        Artist artist = artistRepo.findByUser(user);
        artist.setName(nickname);
        artist.setCity(city);
        String img = saveService.transfer(avatar);
        String backgr = saveService.transfer(background);
        artist.setAvatar(img);
        artist.setBackground(backgr);
        artistRepo.save(artist);


        return artist;
    }


}
