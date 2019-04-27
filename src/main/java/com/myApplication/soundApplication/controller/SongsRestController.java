package com.myApplication.soundApplication.controller;

import com.myApplication.soundApplication.domain.Playlist;
import com.myApplication.soundApplication.domain.Song;
import com.myApplication.soundApplication.domain.User;
import com.myApplication.soundApplication.repos.PlaylistRepo;
import com.myApplication.soundApplication.repos.SongRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
public class SongsRestController {
    @Autowired
    private SongRepo songRepo;
    @Autowired
    private PlaylistRepo playlistRepo;
    //Запросы на страницу с музыкой
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
}
