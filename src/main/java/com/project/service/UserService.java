package com.project.service;

import com.project.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
