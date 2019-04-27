package com.myApplication.soundApplication.domain;


import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
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

    @ManyToMany
    @JoinTable(name="playlists_songs",
            joinColumns=@JoinColumn(name="playlistId"),
            inverseJoinColumns=@JoinColumn(name="songId")
    )
    private List<Song> songs;

    @ManyToMany
    @JoinTable(name="playlists_songs",
            joinColumns=@JoinColumn(name="songId"),
            inverseJoinColumns=@JoinColumn(name="playlistId")
    )
    private List<Playlist> songsOf;

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

    public List<Song> getSongs() {
        return songs;
    }

    public void setSongs(List<Song> songs) {
        this.songs = songs;
    }

    public List<Playlist> getSongsOf() {
        return songsOf;
    }

    public void setSongsOf(List<Playlist> songsOf) {
        this.songsOf = songsOf;
    }
}
