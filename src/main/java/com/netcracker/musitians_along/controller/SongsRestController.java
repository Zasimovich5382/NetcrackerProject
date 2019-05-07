package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.AppConstants;
import com.netcracker.musitians_along.domain.*;
import com.netcracker.musitians_along.repos.ArtistRepo;
import com.netcracker.musitians_along.repos.PlaylistRepo;
import com.netcracker.musitians_along.repos.SongRepo;
import com.netcracker.musitians_along.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

@RestController
public class SongsRestController {
    @Autowired
    private SongRepo songRepo;

    @Autowired
    private PlaylistRepo playlistRepo;

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private ArtistRepo artistRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/songsRest")
    public Map userLibrary(@AuthenticationPrincipal User user){
        Map<String, Object> params = new HashMap();
        Iterable<Song> songs = songRepo.findAll();
        Iterable<Playlist> playlists = playlistRepo.findAllByAuthor(user);
        params.put("songs", songs);
        params.put("playlists", playlists);
        return params;
    }

    @RequestMapping(value ="/songsRest", method = RequestMethod.POST)
    public String addSongToPlaylist(@RequestParam String song,
                                  @RequestParam String playlist){
        Long s = Long.parseLong(song);
        Long p = Long.parseLong(playlist);
        Song songBD = songRepo.findFirstById(s);
        Playlist playlistDB = playlistRepo.findFirstById(p);
        playlistDB.getSongs().add(songBD);
        playlistRepo.save(playlistDB);
        return playlist+song;

    }
    //Запросы на страницу плейлиста
    @GetMapping("/playlistRest/{playlist}")
    public Map playlistRest(@PathVariable Playlist playlist){
        Map<String, Object> params = new HashMap();
        params.put("playlist", playlist);
        return params;
    }


    @RequestMapping(value ="/editUser", method = RequestMethod.POST)
    public User editUser(
            @RequestParam String nickname,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String artist,
            @AuthenticationPrincipal User user) {
        user.setNickname(nickname);
        user.setEmail(email);
        user.setPassword(password);
        if(user.getRoles().contains(Role.ARTIST) && artist.equals("false")){
            user.getRoles().remove(Role.ARTIST);
            Artist artistDB = artistRepo.findByUser(user);
            artistRepo.delete(artistDB);
        } else if(!user.getRoles().contains(Role.ARTIST) && artist.equals("true")){
            user.getRoles().add(Role.ARTIST);
            Artist artistDB = new Artist(user, user.getNickname(), user.getId());
            artistRepo.save(artistDB);
        }
        userRepo.save(user);

        return user;
    }

    @RequestMapping(value ="/addPlaylist", method = RequestMethod.POST)
    public Playlist addPlaylist(
            @RequestParam String title,
            @RequestParam ("file") MultipartFile file,
            @AuthenticationPrincipal User user,
            Map<String, Object> model) throws IOException {
        Playlist playlist = new Playlist(title, user);
        if(file!=null && !file.getOriginalFilename().isEmpty()){
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFilename));
            playlist.setImgName(resultFilename);
        } else playlist.setImgName(AppConstants.NONAME);
        playlistRepo.save(playlist);

        return playlist;
    }

    @RequestMapping(value ="/addPlaylistSong", method = RequestMethod.POST)
    public Playlist addPlaylistSong(@RequestBody Map<String, Object> body)  {
        List<String> array = (List<String>)body.get("array");
        Long playlistId = new Long((Integer)body.get("id"));
        Playlist playlist = playlistRepo.findFirstById(playlistId);
        for(int i=0; i<array.size(); i++){
            Long id = Long.parseLong(array.get(i));
            Song song = songRepo.findFirstById(id);
            playlist.getSongs().add(song);
        }
        playlistRepo.save(playlist);
        return playlist;
    }

    @RequestMapping(value ="/artistInfo/{artist}", method = RequestMethod.GET)
    public Artist artistInfo(@PathVariable("artist") Artist artist)  {
        return artistRepo.findFirstById(artist.getId());
    }

    @GetMapping("/searchSongAddPlaylist")
    public List searchSongAddPlaylist(@RequestParam String title){
        List<String> listSearch = songRepo.findByMetaTitleContainingOrMetaArtistContaining(title,title);
        return listSearch;
    }


    /*@RequestMapping(value ="/addArtistSong", method = RequestMethod.POST)
    public Map addArtistSong(@RequestParam ("song") MultipartFile song,
                             @AuthenticationPrincipal User user)  {


    }*/

}
