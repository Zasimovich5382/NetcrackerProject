package com.netcracker.musitians_along.domain;

import javax.persistence.*;

@Entity
@Table(name = "song")
public class Song {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;

    private String coverUrl;

    private String url;

    private String title;

    private String artist;

    private String metaGenre;

    private String metaDuration;

    private String metaTempo;

    private boolean publicSong;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    public Song(){
    }

    public Song(String title, String artist, String metaGenre, String metaDuration, String metaTempo, User author){
        this.title = title;
        this.artist = artist;
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

    public String getCoverUrl() {
        return coverUrl;
    }

    public void setCoverUrl(String coverUrl) {
        this.coverUrl = coverUrl;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
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

    public boolean isPublicSong() {
        return publicSong;
    }

    public void setPublicSong(boolean publicSong) {
        this.publicSong = publicSong;
    }
}
