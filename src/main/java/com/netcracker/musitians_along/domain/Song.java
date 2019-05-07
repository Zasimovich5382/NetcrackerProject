package com.netcracker.musitians_along.domain;

import javax.persistence.*;

@Entity
@Table(name = "song")
public class Song {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;

    private String imgName;

    private String songPath;

    private String metaTitle;

    private String metaArtist;

    private String metaGenre;

    private String metaDuration;

    private String metaTempo;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    public Song(){
    }

    public Song(String metaTitle, String metaArtist, String metaGenre,String metaDuration, String metaTempo, User author){
        this.metaTitle = metaTitle;
        this.metaArtist = metaArtist;
        this.metaGenre = metaGenre;
        this.metaDuration = metaDuration;
        this.metaTempo = metaTempo;
        this.author = author;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImgName() {
        return imgName;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName;
    }

    public String getSongPath() {
        return songPath;
    }

    public void setSongPath(String songPath) {
        this.songPath = songPath;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getMetaTitle() {
        return metaTitle;
    }

    public void setMetaTitle(String metaTitle) {
        this.metaTitle = metaTitle;
    }

    public String getMetaArtist() {
        return metaArtist;
    }

    public void setMetaArtist(String metaArtist) {
        this.metaArtist = metaArtist;
    }

    public String getMetaGenre() {
        return metaGenre;
    }

    public void setMetaGenre(String metaGenre) {
        this.metaGenre = metaGenre;
    }

    public String getMetaDuration() {
        return metaDuration;
    }

    public void setMetaDuration(String metaDuration) {
        this.metaDuration = metaDuration;
    }

    public String getMetaTempo() {
        return metaTempo;
    }

    public void setMetaTempo(String metaTempo) {
        this.metaTempo = metaTempo;
    }
}
