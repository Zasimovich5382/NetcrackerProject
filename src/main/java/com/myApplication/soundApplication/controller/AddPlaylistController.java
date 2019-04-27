package com.myApplication.soundApplication.controller;

import com.myApplication.soundApplication.domain.Playlist;
import com.myApplication.soundApplication.domain.User;
import com.myApplication.soundApplication.repos.PlaylistRepo;
import com.myApplication.soundApplication.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.myApplication.soundApplication.AppConstants;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/addPlaylist")
public class AddPlaylistController {
    @Autowired
    private PlaylistRepo playlistRepo;
    @Autowired
    private UserRepo userRepo;
    @Value("${upload.path}")
    private String uploadPath;
    @GetMapping
    public String addPlaylist(){
        return AppConstants.ADDPLAYLIST;
    }

    @PostMapping
    public String addNewPlaylist(@AuthenticationPrincipal User user,
                                 @RequestParam String title,
                                 @RequestParam ("file")MultipartFile file,
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
            playlist.setImg_name(resultFilename);
        } else playlist.setImg_name(AppConstants.NONAME);
        playlistRepo.save(playlist);
        return "redirect:/userLibrary";
    }
}
