package com.netcracker.musitians_along.repos;

import com.netcracker.musitians_along.domain.Song;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface SongRepo extends CrudRepository<Song,Long> {
    Song findFirstById(Long id);

    List<String> findByMetaArtistContaining(String title);

    List<String> findByMetaTitleContainingOrMetaArtistContaining(String metatitle, String metaartist);
}
