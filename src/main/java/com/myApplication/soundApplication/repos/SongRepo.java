package com.myApplication.soundApplication.repos;

import com.myApplication.soundApplication.domain.Song;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface SongRepo extends CrudRepository<Song,Long> {
    Song findFirstById(Long id);
}
