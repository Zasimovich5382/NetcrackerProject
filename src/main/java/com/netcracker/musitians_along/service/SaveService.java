package com.netcracker.musitians_along.service;

import com.netcracker.musitians_along.domain.Song;
import com.netcracker.musitians_along.domain.User;
import com.netcracker.musitians_along.repos.SongRepo;
import org.apache.tika.exception.TikaException;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.parser.Parser;
import org.apache.tika.parser.mp3.Mp3Parser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.xml.sax.ContentHandler;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.io.*;
import java.util.UUID;

@Service
public class SaveService {
    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private SongRepo songRepo;

    public String transfer(MultipartFile file) throws IOException {
        String resultFilename = "null";

        if(file!=null && !file.getOriginalFilename().isEmpty()){
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            resultFilename = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFilename));

        }
        return resultFilename;
    }

    public Song extractMeta(MultipartFile file, User user, MultipartFile img) {
        Song song = new Song();
        try {
            String resultFilename = transfer(file);

            InputStream input = new FileInputStream(new File(uploadPath + "/" + resultFilename));
            ContentHandler handler = new DefaultHandler();
            Metadata metadata = new Metadata();
            Parser parser = new Mp3Parser();
            ParseContext parseCtx = new ParseContext();
            parser.parse(input, handler, metadata, parseCtx);
            input.close();

            song = new Song(metadata.get("title"), metadata.get("xmpDM:artist"), metadata.get("xmpDM:genre"), metadata.get("xmpDM:duration"), metadata.get("xmpDM:tempo"), user);
            song.setUrl("/sound/"+resultFilename);
            song.setCoverUrl(transfer(img));


        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (TikaException e) {
            e.printStackTrace();
        }
        return song;
    }

}