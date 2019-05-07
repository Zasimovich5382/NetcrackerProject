package com.netcracker.musitians_along.repos;

import com.netcracker.musitians_along.domain.Artist;
import com.netcracker.musitians_along.domain.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ArtistRepo extends CrudRepository<Artist, Long> {
    Artist findByUser(User user);

    List<Artist> findByNameContaining(String name);

    Artist findFirstById(Long id);
}
