package com.netcracker.musitians_along.repos;

import com.netcracker.musitians_along.domain.Song;
import com.netcracker.musitians_along.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface SongRepo extends CrudRepository<Song,Long> {
    Song findFirstById(Long id);

    List<String> findByArtistContaining(String title);

    List<String> findByTitleContainingOrArtistContaining(String title, String artist);

    Page<Song> findByTitleContaining(String title, Pageable pageable);

    Page<Song> findByArtistContaining(String artist, Pageable pageable);

    Iterable<Song> findByAuthor(User id);


}
