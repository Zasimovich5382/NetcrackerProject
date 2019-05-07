package com.netcracker.musitians_along.repos;

import com.netcracker.musitians_along.domain.Playlist;
import com.netcracker.musitians_along.domain.User;
import org.springframework.data.repository.CrudRepository;

public interface PlaylistRepo extends CrudRepository<Playlist,Long> {
    Iterable<Playlist> findAllByAuthor(User user);
    Playlist findFirstById(Long id);
}
