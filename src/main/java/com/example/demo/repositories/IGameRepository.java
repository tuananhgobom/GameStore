package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Game;
import com.example.demo.entities.GameType;
@Repository
public interface IGameRepository extends JpaRepository<Game, Long> {
  Page<Game> findByType(GameType type,Pageable pageables);
  @Query("Select o from Game o where o.name like ?1")
  List<Game> findByNameLike(String name);
  @Query("Select o from Game o where o.type = ?1 and o.name like ?2")
  List<Game> findByTypeAndNameLike(GameType type,String name); 
}
