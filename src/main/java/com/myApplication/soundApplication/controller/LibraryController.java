package com.myApplication.soundApplication.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.myApplication.soundApplication.AppConstants;


@Controller
@RequestMapping({"/userLibrary","/"})
public class LibraryController {
    @GetMapping
    public String userLibrary(){
        return AppConstants.LIBRARY;
    }


}
