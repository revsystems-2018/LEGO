package edu.lego.care4you.data.api.repository;

import edu.lego.care4you.data.domain.User;

import java.util.List;

public interface UserRepository extends GenericRepository<User> {

    List<User> findByEmailPromotion(String emailPromotion);
}
