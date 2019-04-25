package com.myApplication.soundApplication.controller;

import com.myApplication.soundApplication.domain.Playlist;
import com.myApplication.soundApplication.domain.Song;
import com.myApplication.soundApplication.domain.User;
import com.myApplication.soundApplication.repos.PlaylistRepo;
import com.myApplication.soundApplication.repos.SongRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.myApplication.soundApplication.AppConstants;


@Controller
public class SongsController {
    @Autowired
    private SongRepo songRepo;
    @Autowired
    private PlaylistRepo playlistRepo;
    @GetMapping("/songs")
    public String userLibrary(@AuthenticationPrincipal User user, Model model){
        Iterable<Song> songs = songRepo.findAll();
        Iterable<Playlist> playlists = playlistRepo.findAllByAuthor(user);
        model.addAttribute("songs", songs);
        model.addAttribute("playlists", playlists);
        return "songs";
    }

    @RequestMapping(value = "/aadSongToPlaylist", method = RequestMethod.POST)
    public @ResponseBody
    String aadSongToPlaylist(@RequestParam Song song,
                             @RequestParam Playlist playlist){
        playlist.getSongs().add(song);
        playlistRepo.save(playlist);
        return "redirect:/songs";
    }


}