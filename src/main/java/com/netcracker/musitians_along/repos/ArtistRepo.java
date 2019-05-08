package com.netcracker.musitians_along.repos;

import com.netcracker.musitians_along.domain.Artist;
import com.netcracker.musitians_along.domain.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ArtistRepo extends CrudRepository<Artist, Long> {
    Artist findByUser(User user);

    Page<Artist> findByNameContaining(String name, Pageable pageable);

    Artist findFirstById(Long id);
}
