package com.myApplication.soundApplication.controller;

import com.myApplication.soundApplication.AppConstants;
import com.myApplication.soundApplication.domain.Playlist;
import com.myApplication.soundApplication.domain.Song;
import com.myApplication.soundApplication.domain.User;
import com.myApplication.soundApplication.repos.SongRepo;
import com.myApplication.soundApplication.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/addSong")
public class AddSongController {
    @Autowired
    private SongRepo songRepo;
    @Autowired
    private UserRepo userRepo;
    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping
    public String addSong(){
        return AppConstants.ADDSONG;
    }

    @PostMapping
    public String addNewSong(@AuthenticationPrincipal User user,
                                 @RequestParam String title,
                                 @RequestParam ("file") MultipartFile file,
                                 Map<String, Object> model) throws IOException {
        Song song = new Song(title, user);

        if(file!=null && !file.getOriginalFilename().isEmpty()){
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFilename));
            song.setSong_name(resultFilename);
        }
        song.setSong_name(file.getOriginalFilename());
        songRepo.save(song);
        return "redirect:/userLibrary";
    }
}
