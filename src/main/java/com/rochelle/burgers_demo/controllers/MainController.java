package com.rochelle.burgers_demo.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rochelle.burgers_demo.models.Burger;
import com.rochelle.burgers_demo.services.BurgerService;

@Controller
public class MainController {

    @Autowired BurgerService burgerService;

    // this route iis both create/read all
    // create our model that is going to track all the data 
    @RequestMapping("/")
    public String index(@ModelAttribute("burger")Burger burger, Model model) {
        List<Burger> burgers = burgerService.getAllBurgers();
        System.out.println(burgers);
        model.addAttribute("burgers", burgers);
        return "index.jsp";
    }

    // need a handler for the form 
    @PostMapping("/burgers")
    // need @ valid to also check errors 
    // then need @model attributes
    // then need binding result
    public String create(@Valid @ModelAttribute("burger")Burger burger, BindingResult result) {
        if (result.hasErrors()) {
            return "index.jsp";
        } else {
            // we want to make a burger
            burgerService.createBurger(burger);
        }
        return "redirect:/";
    }


}
