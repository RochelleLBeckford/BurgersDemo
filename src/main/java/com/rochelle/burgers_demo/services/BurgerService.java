package com.rochelle.burgers_demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rochelle.burgers_demo.models.Burger;
import com.rochelle.burgers_demo.repositories.BurgerRepository;

@Service
public class BurgerService {
    
    @Autowired BurgerRepository burgerRepository;

    public void createBurger(Burger burger) {
        burgerRepository.save(burger);
    }

    // create a method that will get all burgers
    public List<Burger> getAllBurgers() {
        return burgerRepository.findAll();
    }
}
