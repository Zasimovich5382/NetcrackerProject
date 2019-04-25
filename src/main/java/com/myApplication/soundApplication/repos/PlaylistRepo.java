package com.myApplication.soundApplication.repos;

import com.myApplication.soundApplication.domain.Playlist;
import com.myApplication.soundApplication.domain.User;
import org.springframework.data.repository.CrudRepository;

public interface PlaylistRepo extends CrudRepository<Playlist,Long> {
    Iterable<Playlist> findAllByAuthor(User user);
}
