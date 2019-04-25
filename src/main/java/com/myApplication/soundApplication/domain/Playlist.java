package com.myApplication.soundApplication.domain;


import javax.persistence.*;
import java.util.ArrayList;
import java.util.Set;

@Entity
@Table(name = "playlist")
public class Playlist {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;

    private String title;

    private String img_name;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @ElementCollection(targetClass = Song.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "playlist_songs1", joinColumns =@JoinColumn(name = "playlist_id"))
    private Set<Song> songs;

    public Playlist(){
    }

    public Playlist(String title,User author){
        this.title = title;
        this.author=author;
    }

    public String GetAuthorName(){
        return author != null ? author.getNickname():"<none>";
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImg_name() {
        return img_name;
    }

    public void setImg_name(String img_url) {
        this.img_name = img_url;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Set<Song> getSongs() {
        return songs;
    }

    public void setSongs(Set<Song> songs) {
        this.songs = songs;
    }
}
